#!/bin/bash -e
#
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=6.4.0
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
	d758d74e81ed11d073e0ebafe817b030f7745773a648748f68dbd5e9ecd1c8a0
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
