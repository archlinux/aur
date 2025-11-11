# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-requests-pkcs12
_pkg=requests_pkcs12
pkgver=1.27
pkgrel=1
pkgdesc='Adds PKCS#12 support to python-requests'
arch=('any')
license=('ISC')
url="https://github.com/m-click/requests_pkcs12"
depends=('python-requests' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha512sums=('c15ae672538770ccb41dadfd8db137bd71c237cc2ffd359769d2748f752daeb06b995b7f0ebeaa8d00e68017d1a3d1fdfedb5850b4e1dd112d7920a2a019f766')

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
