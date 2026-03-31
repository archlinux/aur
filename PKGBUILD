# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.6.1
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
sha256sums=('a15fdef2048df87c8602b2cd6365cc8eee6d4339b7753c9ad5d0937bc4278b48')

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

