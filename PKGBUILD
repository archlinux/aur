# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.49.1
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
optdepends=('python-httpx: async support')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('823ad7365ef300cd65304299e0b78216097407c19eeea53c879c305a5c804e1580f24c7c125b26066aa1e1646006ae6874ea0e13eba5011162fb147d965adbc3')
b2sums=('6538d7640f7ddad91aaced2dffabf67a25314209583d4274627564d4f0824a4c90bb1dc0d657d0bc2aff29b63bcc0db207f8c41cfb6ac1b0a2dcc5e6c11009fe')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

