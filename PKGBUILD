#!/bin/bash -e
#
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=6.4.1
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=(
	any
)
url=https://github.com/lovesegfault/beautysh
license=(
	MIT
)
depends=(
	python-colorama
	python-editorconfig
)
checkdepends=(
	python-pytest
	python-hypothesis
	python-yaml
)
makedepends=(
	python-build
	python-hatchling
	python-installer
	python-wheel
)
source=(
	"${url}/releases/download/v${pkgver}/beautysh-${pkgver}.tar.gz"
)
sha256sums=(
	5beeccdddf02cb11088e009d60e367a28aab1609fbe8da9e5a19a7c59fa28f56
)

: "${pkgname}"
: "${pkgrel}"
: "${pkgdesc}"
: "${arch[@]}"
: "${license[@]}"
: "${depends[@]}"
: "${checkdepends[@]}"
: "${makedepends[@]}"
: "${source[@]}"
: "${sha256sums[@]}"

build() {
	cd "beautysh-${pkgver}"

	python -m build --no-isolation --wheel
}

check() {
	cd "beautysh-${pkgver}"

	pytest
}

package() {
	: "${pkgdir:?}"

	cd "beautysh-${pkgver}"

	python -m installer --destdir "${pkgdir}" dist/beautysh-"${pkgver}"-*-none-any.whl
}
