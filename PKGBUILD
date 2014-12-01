# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=grpn
pkgver=1.4.0
pkgrel=1
pkgdesc='A graphical reverse polish notation (RPN) calculator'
arch=('i686' 'x86_64')
url='http://www.getreu.net/'
license=('GPL')
depends=('gtk2')
source=(http://www.getreu.net/public/downloads/software/$pkgname/$pkgname-$pkgver/${pkgname}_${pkgver}-1.tar.gz
        $pkgname.desktop)
sha256sums=('51fe7800cecab5119c94a87f6b263cc65073cfa7d655f538e7adf5273d092947'
            '2c0f7685e7423e14f93c38fca951b8497009da4705f4b629f01c4048b32697ab')

build() {
  cd "${srcdir}"/src

  make
}

package() {
  cd "${srcdir}"/src

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1

#.desktop file + icon
  install -D -m644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/src/icon.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
