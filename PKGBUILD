# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.33.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
optdepends=('python-httpx: async support')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f566e753198980bdf4a8fd4db7848dd33de0e5f5c8ce8032add011772a9f13d6d8e0a2724cc33a5f6154d79607da1a816b66b21f8b0062b6bdd339cc2396ac30')
b2sums=('597c1ea68ed3bfaec698ec8678ebfcec78940ec5c545661d42199152975ec1f72ff60a7221507bd80f98b2fa368ded53b2fc216299e1f2bc4e810f0ee5bbc6bf')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

