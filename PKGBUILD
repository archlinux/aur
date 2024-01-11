# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-requests-pkcs12
_pkg=requests_pkcs12
pkgver=1.22
pkgrel=1
pkgdesc='Adds PKCS#12 support to python-requests'
arch=('any')
license=('ISC')
url="https://github.com/m-click/requests_pkcs12"
depends=('python-requests' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('e33f6479c84fbe664917feeb37c9949691f3cee1783ffa0580c1f494541707f5')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	python setup.py test
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
