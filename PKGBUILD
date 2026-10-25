# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=trackerjacker
pkgver=2.2.0
pkgrel=1
pkgdesc="Map and track WiFi networks and devices through raw 802.11 monitoring"
arch=('any')
url="https://github.com/calebmadrigal/trackerjacker"
license=('MIT')
depends=('python-pyaml' 'python-ruamel-yaml' 'python-scapy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz
")
sha256sums=('984ac4796025e623ab1f12f22733acbbee8ddb5d51a4a186703d1e16692008fe')

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
