# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.0.0
pkgrel=1
pkgdesc='A cross-platform task scheduler and reminder configured in YAML.'
arch=(any)
url='https://github.com/hikyae/schedrem'
license=(MIT)
depends=(
	python
	python-psutil
	python-pyaudio
	python-pydantic
	python-pyyaml
	python-watchdog
)
makedepends=(
	python-hatchling
	python-installer
)
checkdepends=(
	python-freezegun
	python-pytest
)
source=($pkgname-$pkgver.tar.gz::https://github.com/hikyae/schedrem/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8e8757154455cb0d3d5b3bee8a461ef412e5b71de7cf1a0808bce41bbc659878')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m hatchling build
}

check() {
	cd "$srcdir/${pkgname}-${pkgver}"
	pytest
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

