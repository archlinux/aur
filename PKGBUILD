# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fastecdsa
pkgver=2.2.1
pkgrel=1
pkgdesc="Python library for fast elliptic curve crypto"
arch=('x86_64')
url="https://github.com/antonkueltz/fastecdsa"
license=('Unlicense')
depends=('python' 'gmp')
makedepends=('python-setuptools' 'python-sphinx')
changelog=CHANGELOG.md
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/fastecdsa/fastecdsa-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/f/fastecdsa/fastecdsa-$pkgver.tar.gz.asc")
sha256sums=('48d59fcd18d0892a6b76463d4c98caa217975414f6d853af7cfcbbb0284cb52d'
            'SKIP')
validpgpkeys=('9D3197AB0B3E694D33C89C3E8C1324A2DACDE5AA')

prepare() {
	cd "fastecdsa-$pkgver"
	sed -i '/packages=/s/find_packages()/find_packages(exclude=["fastecdsa.tests*"])/' setup.py
}

build() {
	cd "fastecdsa-$pkgver"
	python setup.py build
}

check() {
	cd "fastecdsa-$pkgver"
	python setup.py test
}

package() {
	cd "fastecdsa-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
