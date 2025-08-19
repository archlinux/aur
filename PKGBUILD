# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.4.4
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
sha256sums=('d4332bade8f7beb1a3045874670418722916ed38f4a312394b08e35bda19a361')

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

