# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.5.3
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
sha256sums=('50e2e59d970b41886c2ef7dacc90dc64b7a98d7cb88f3bf643d7993a1f542401')

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

