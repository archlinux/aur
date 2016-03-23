# Maintainer: One
pkgname=kav
pkgver=0.1
pkgrel=3
pkgdesc="Antivirus scanner from kaspersky rescue disk"
url=" "
arch=('x86_64' 'i686')
license=('custom')
depends=()
optdepends=()
makedepends=('squashfs-tools')
conflicts=()
replaces=()
backup=()
install='kav.install'
PKGEXT='.pkg.tar'
source=("http://rescuedisk.kaspersky-labs.com/rescuedisk/updatable/kav_rescue_10.iso" "kav.desktop" "kav" "kav.png")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
cd "${srcdir}/"
cp rescue/LiveOS/squashfs.img .
unsquashfs squashfs.img
cp squashfs-root/LiveOS/ext3fs.img .
rm -f squashfs.img
}

package() {
  cd "${srcdir}/"
  mkdir -p "$pkgdir/opt/kav"
  cp ext3fs.img "$pkgdir/opt/kav"
  install -Dm644 "${srcdir}/kav.png" "${pkgdir}/usr/share/pixmaps/kav.png"
  install -Dm755 "${srcdir}/kav.desktop" "${pkgdir}/usr/share/applications/kav.desktop"
  install -Dm755 "${srcdir}/kav" "${pkgdir}/usr/bin/kav"
  }

# vim:set ts=2 sw=2 et:
