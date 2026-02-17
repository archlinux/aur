#!/bin/bash -e
#
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=6.4.2
pkgrel=2
pkgdesc="A Bash beautifier for the masses"
arch=(
	any
)
url=https://github.com/lovesegfault/beautysh
license=(
	MIT
)
depends=(
	python
	python-colorama
	python-editorconfig
	python-tomli
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
	e3d762006e8930e6fec8842adeb7e124c283bd63dbd83a1466f91e4caf5765b4
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

	install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
