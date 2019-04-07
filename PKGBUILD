# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=zrandr
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple Qt5 front end for xrandr"
arch=('any')
url="https://github.com/fralonra/zrandr"
license=('GPL')
depends=('xorg-xrandr' 'qt5-base' 'qt5-tools')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('254b8365bd2d0fa45428c59c9d87c357')

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
