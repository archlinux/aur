# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=resend-python
pkgname=python-resend
pkgver=2.27.0
pkgrel=1
pkgdesc="Resend's Python SDK"
arch=('any')
url="https://github.com/resend/${_name}"
license=('MIT')
depends=('python>=3.6' 'python-typing_extensions' 'python-requests')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
optdepends=('python-httpx: async support')
source=("https://github.com/resend/resend-python/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8a6c72776bbe9a93f7755ccad5179d99cc69ec106cc5198c404c228313bcabe9ba6c64e8be537ddd508b489f5909565651e7d896df994033953558dfb63004be')
b2sums=('4234a6acea195799d6da8fd70b83459d0932d4e2ccc48afe509a2bf28a9aa66233bc6312decc89bb36340d6e5b6cb7092d2865ec30c5f5760e0403308143ce1e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

