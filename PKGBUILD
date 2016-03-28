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

source_armv6h=($_binname::https://www.dropbox.com/s/mr61q8sdu4n2wm1/cargo-0.10.0-stable-2016-03-22-61ad6a0-arm-unknown-linux-gnueabihf-3a21f50ff66366847653f7873a8cede579d5863f.tar.gz)

source_armv7h=($_binname::https://www.dropbox.com/s/yk8s3wrnntguizl/cargo-0.10.0-stable-2016-03-22-61ad6a0-arm-unknown-linux-gnueabihf-b8f8f8d7b7b1e7acf97f58708a03c39cd1252011.tar.gz)

md5sums_armv6h=('494e15e0bd9ec4d4d0e26b45791f22b0')
md5sums_armv7h=('a3c5aab52995f8c6bb551d62b4a3a372')

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
