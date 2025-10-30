#!/bin/bash -e
#
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=6.3.3
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
makedepends=(
	python-build
	python-hatchling
	python-installer
	python-pytest
	python-wheel
)
source=(
	"${url}/releases/download/v${pkgver}/beautysh-${pkgver}.tar.gz"
)
sha256sums=(
	a86e1ea1bc42c9251eb2543403156356805b0983f29b4139b5cc27f270f963a7
)

: "${pkgname}"
: "${pkgrel}"
: "${pkgdesc}"
: "${arch[@]}"
: "${license[@]}"
: "${depends[@]}"
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
