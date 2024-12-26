# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-requests-pkcs12
_pkg=requests_pkcs12
pkgver=1.25
pkgrel=1
pkgdesc='Adds PKCS#12 support to python-requests'
arch=('any')
license=('ISC')
url="https://github.com/m-click/requests_pkcs12"
depends=('python-requests' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha512sums=('8e03093f70871909fde53007133ac7428bde6391300647a94657e56b1e72027056be0f8c9257b4f8733a68477e2d66b14c30b68b21e24d097713ca33ed68fca7')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
