# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.4.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/hikyae/schedrem/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97323331614ae36cb229e4d72a1853bffa85fcbb34ae2c05c2c6fcafbea73288')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m hatchling build
}

check() {
	cd "$srcdir/${pkgname}-${pkgver}"
	pytest -o addopts=""
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

