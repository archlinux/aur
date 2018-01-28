# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=grpn
pkgver=1.5.1
pkgrel=1
pkgdesc='A graphical reverse polish notation (RPN) calculator'
arch=('i686' 'x86_64')
url='https://github.com/getreu/grpn'
license=('GPL')
depends=('gtk2')
source=($pkgname-$pkgver.tar.gz::https://github.com/getreu/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('0498d15c5544b9a278a2d9b89733eaf70c8d1667a060add8bec4a03c21f5fbbb')

build() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/src

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1

#.desktop file + icon
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/src/debian/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/src/icon.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
