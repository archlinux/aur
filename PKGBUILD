# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fastecdsa
pkgver=2.2.3
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
sha256sums=('269bdb0f618b38f8f6aec9d23d23db518046c3cee01a954fa6aa7322a1a7db8f'
            'SKIP')
validpgpkeys=('67C1C1178894F9017D47AC0E15AB0E7C8A4019BF')

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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
