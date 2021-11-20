# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-qprompt
pkgver=0.16.3
pkgrel=1
pkgdesc="Library for quick CLI user menus"
arch=('any')
url="https://github.com/jeffrimko/qprompt"
license=('MIT')
depends=('python-iterfzf')
makedepends=('python-setuptools')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/qprompt-$pkgver.tar.gz")
sha256sums=('faf89d49cedfe8663886cb99151eb2f185ca5fa6b1736c3ada09721b44918931')

prepare() {
	cd "Qprompt-qprompt-$pkgver/lib/"
	sed -i '/data_files/d' setup.py
}

build() {
	cd "Qprompt-qprompt-$pkgver/lib/"
	python setup.py build
}

# check() {
# 	cd "Qprompt-qprompt-$pkgver"
# 	python -m unittest
# }

package() {
	cd "Qprompt-qprompt-$pkgver/lib/"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	cd ..
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.adoc AUTHORS.adoc -t "$pkgdir/usr/share/doc/$pkgname/"
}
