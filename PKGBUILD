# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.8
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=(
	'python>=3.6'
	'python-appdirs>=1'
	'python-attrs'
	'python-click>=7'
	'python-construct>=2.10.56'
	'python-croniter'
	'python-cryptography>=3'
	'python-defusedxml'
	'python-netifaces'
	'python-pytz'
	'python-tqdm>=4'
	'python-yaml'
	'python-zeroconf')
optdepends=('python-android-backup-tools: Android backup extraction support')
makedepends=('python-dephell')
install=miio.install
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('c2dec86e952e8fd2ea1bbd2db43b2b009e06cc58cfc9611c5655c23105655f12a5e95ae02a018b48531a2d93465bcaf369d48c61e3d8325cfa0982259a2bd79b')

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
