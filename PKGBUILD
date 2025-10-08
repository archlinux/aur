# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=python-onion-location-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Python library for discovering Onion-Location HTTP headers'
arch=(any)
url="https://codeberg.org/Freso/${pkgname%-git}"
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
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    hatch version
}

prepare () {
    cd "${pkgname%-git}"
    # Remove potential artifacts from earlier builds
    git clean -dfx
}

build() {
    cd "${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname%-git}/README.rst"
}
