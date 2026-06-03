# Maintainer: Hec <hec@heccraft.com>
pkgname=uutils-coreutils-shim
pkgver=0.9.0
pkgrel=1
pkgdesc="Replaces GNU coreutils with uutils coreutils"
arch=('any')
url="https://uutils.github.io/"
license=('MIT')
depends=(uutils-coreutils)
provides=(coreutils)
conflicts=(coreutils)

package() {
  mkdir -p "$pkgdir/usr/bin"
  for f in $(uu-coreutils --list); do
    ln -s uu-${f} "$pkgdir/usr/bin/${f}"
  done

  # owned by util-linux
  rm -f $pkgdir/usr/bin/{kill,more,uptime}
}
