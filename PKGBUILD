# Maintainer: Lawrence Chiappelli <lawrence chip at proton mail dot com>
pkgname='screendimmer'
pkgver=0.4.2
pkgrel=1
pkgdesc="A tray application to dim your monitor brightness."
arch=(x86_64)
url="https://github.com/Lawrence-Chiappelli/screendimmer.git"
license=('MIT')
depends=('python' 'python-screeninfo' 'python-pyqt5')
makedepends=('python-setuptools')
backup=("etc/$pkgname/brightness.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lawrence-Chiappelli/screendimmer/archive/$pkgver.tar.gz")
md5sums=('076bc845e986ed2b21afb83673a48582')

build() {
	cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm646 brightness.ini "$pkgdir/etc/$pkgname/brightness.ini"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "resources/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
