# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.34.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
optdepends=('python-httpx: async support')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b304dfcf6e67a6ffd6262a1719aecd53d61b44d748b13e7f8d34039b35475a5aa3b38d2ba745aafb64b856f5ee11cde1521d326d2590ead00e761fc24c597897')
b2sums=('e4dea79394c68fa340a4049731fee1ea37402b285bb87180f06fc790e73a3e16c45ceb7d4d85a2b5da004d28e66a6f87b8b73b513337cd718351e22451a0dc36')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

