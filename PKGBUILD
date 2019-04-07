# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=zrandr
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple Qt5 front end for xrandr"
arch=('any')
url="https://github.com/fralonra/zrandr"
license=('GPL')
depends=('xorg-xrandr' 'qt5-base' 'qt5-tools')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('f50ee483123b70c985231abaa48d5909')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	lrelease -verbose $pkgname.pro
	qmake $pkgname.pro
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 build/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin/"

  for _i in 16 64 128 256; do
    install -Dm644 build/icons/$pkgname-${_i}x${_i}.png \
    "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/$pkgname.png"
  done

  for prog in zrandr; do
    install -Dm644 build/icons/${prog}.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$prog.svg"
  done
}
