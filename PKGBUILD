# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=trackerjacker
pkgver=1.9.0
pkgrel=3
pkgdesc="Map and track WiFi networks and devices through raw 802.11 monitoring"
arch=('any')
url="https://github.com/calebmadrigal/trackerjacker"
license=('MIT')
depends=('python-pyaml' 'python-ruamel-yaml' 'python-scapy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d11c984c85eb5c9ffec5d5ae74eaaa1bed273b827c9cb28511b3bab22d71f3fd')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's/[=<>]=.*//g' requirements.txt
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
