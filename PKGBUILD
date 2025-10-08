# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=python-onion-location
pkgver=0.1.0
pkgrel=1
pkgdesc='Python library for discovering Onion-Location HTTP headers'
arch=(any)
url="https://codeberg.org/Freso/${pkgname}"
license=('AGPL-3.0-or-later')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-lxml'
)
makedepends=(
    'python-hatchling'
    'python-hatch-vcs'
    # Generic/Arch Linux
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('5f87a045b57a2b4b75f9328f1bb0ee48d16de6092b57405afc8e6ec34810c8e5111d7137a9b9d36d39b994693b2c2785dd2225638f8ccbcca90a4a212b60f1bb')

build() {
    cd "${pkgname}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
