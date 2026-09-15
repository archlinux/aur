# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=schedrem
pkgver=1.7.1
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
sha256sums=('707a9fad2d9ac7f5109f81082699626b3bf611045f809f06c1a0fd70d1062d43')

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

