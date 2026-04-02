# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.6.2
pkgrel=1
pkgdesc='A cross-platform task scheduler and reminder configured in YAML.'
arch=(any)
url='https://github.com/hikyae/schedrem'
license=(MIT)
depends=(
	pyside6
	python
	python-psutil
	python-pyaudio
	python-pydantic
	python-watchdog
	python-yaml
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
sha256sums=('793c391ec9a55492e8aea24147bb3225655a5451eb236dc90be51c8eeb1c47f4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m hatchling build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	pytest -o addopts=""
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

