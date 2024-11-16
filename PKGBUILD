# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.1.0
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
sha256sums=('fd8127e2b0f851b5274d0c3a24654c70200eacfe28be4e31fb48efa6c82a97c4')

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

