# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Patrick Lühne <patrick-arch@luehne.de>

pkgname=python-miio
pkgver=0.5.6
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi smart appliances"
url="https://github.com/rytilahti/python-miio"
arch=('any')
license=('GPL3')
depends=('python>=3.6' 'python-appdirs' 'python-attrs' 'python-click>=7' 'python-construct' 'python-cryptography' 'python-netifaces' 'python-pytz' 'python-tqdm' 'python-zeroconf')
optdepends=('python-android-backup-tools: Android backup extraction support')
makedepends=('python-dephell')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('c1f94d0129cf1992dbf4d27ab0bae56c0bccb9be62ae51593f3a49dc7bd90209839188f498dad97778b3c0321506b372c3e9af2f5ec72db01b867cfe2de4848e')

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
