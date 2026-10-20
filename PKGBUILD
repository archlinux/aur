# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.8.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/hikyae/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15ea3e461bf094c3902c46ce463e111e59a6225f601562087e666882bd1974c0')

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

