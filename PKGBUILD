# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=zrandr
pkgver=0.2
pkgrel=1
pkgdesc="A simple Qt front end for xrandr"
arch=('any')
url="https://github.com/fralonra/zrandr"
license=('GPL')
depends=('xorg-xrandr' 'qt5-base')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('66ab5fc2792e298a648faf785fb68acf')

build() {
	cd "$srcdir/$pkgname-$pkgver"
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
