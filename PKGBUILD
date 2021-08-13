# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.7
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=(
	'python>=3.6'
	'python-appdirs'
	'python-attrs'
	'python-click>=7'
	'python-construct'
	'python-croniter'
	'python-cryptography'
	'python-netifaces'
	'python-pytz'
	'python-tqdm'
	'python-yaml'
	'python-zeroconf')
optdepends=('python-android-backup-tools: Android backup extraction support')
makedepends=('python-dephell')
install=miio.install
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('d44f48875c72fc85f99859293528c140b9ded80c39c53d4181f499159e75fc95d6625a51d43c1fb1c32f29787346d5e8cc7c12d35103177aaefbcee0aebe5f43')

prepare() {
	cd "$pkgname-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --prefix=/usr --optimize=1 --root="${pkgdir}" --skip-build
	install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
