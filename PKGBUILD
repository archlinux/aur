# $Id$
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christopher Reimer <mail+aur@c-reimer.de>

_basename=cargo-arm
pkgname=cargo-arm-bin
pkgver=0.10.0
pkgrel=1
_binname=$_basename-$pkgver-bin.tar.gz
pkgdesc='Rust package manager'
url='https://github.com/warricksothr/RustBuild'
arch=(armv6h armv7h)
license=('custom')
depends=('curl' 'rust')
options=('!emptydirs')

provides=("cargo=$pkgver")
conflicts=("cargo")

source_armv6h=($_binname::https://www.dropbox.com/s/adw6vws6s0cma01/cargo-0.10.0-stable-2016-03-04-75412ce-arm-unknown-linux-gnueabihf-c92a755b827f6e6bbf2dc1de1c6bede561eb991d.tar.gz)

source_armv7h=($_binname::https://www.dropbox.com/s/0vczni7cti9afwl/cargo-0.10.0-stable-2016-03-04-75412ce-arm-unknown-linux-gnueabihf-cb518314e9500dfe870ef9dff1e906e2a1e7b493.tar.gz)

md5sums_armv6h=('6b80af1c8bda76ada92092c7f610f14e')
md5sums_armv7h=('6b80af1c8bda76ada92092c7f610f14e')

noextract=("$_binname")

package() {
  mkdir "$pkgdir"/usr

  tar -xf $srcdir/$_binname -C "$pkgdir"/usr

  # Contains reference to $srcdir and $pkgdir
  find "$pkgdir" -name install.log -delete
  find "$pkgdir" -name manifest-cargo -delete

  # Conflicts with the rust package
  find "$pkgdir" -name uninstall.sh -delete

  install -d "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/usr/etc/bash_completion.d/cargo" \
    "$pkgdir/usr/share/bash-completion/completions/cargo"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/cargo/LICENSE"* \
    "$pkgdir/usr/share/licenses/$pkgname"
}
