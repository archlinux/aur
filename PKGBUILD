#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname=inja
pkgver=3.3.0
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
epoch=
# shellcheck disable=SC2034
pkgdesc="A template engine for modern C++."
# shellcheck disable=SC2034
arch=("any")
url="https://github.com/pantor/${pkgname}"
# shellcheck disable=SC2034
license=("MIT")
# shellcheck disable=SC2034
groups=()
# shellcheck disable=SC2034
depends=("nlohmann-json")
# shellcheck disable=SC2034
makedepends=("cmake" "gcc" "make")
# shellcheck disable=SC2034
checkdepends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=()
# shellcheck disable=SC2034
conflicts=()
# shellcheck disable=SC2034
replaces=()
# shellcheck disable=SC2034
backup=()
# shellcheck disable=SC2034
options=()
# shellcheck disable=SC2034
install=
# shellcheck disable=SC2034
changelog=
# shellcheck disable=SC2034
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# shellcheck disable=SC2034
noextract=()
# shellcheck disable=SC2034
sha256sums=("e628d994762dcdaa9a97f63a9b8b73d9af51af0ffa5acea6bdbba0aceaf8ee25")
# shellcheck disable=SC2034
validpgpkeys=()

build()
{
    # shellcheck disable=SC2154
    mkdir -p "${srcdir}"/"${pkgname}"-"${pkgver}"/build/
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ || exit
    cmake -D BUILD_BENCHMARK=OFF -D BUILD_TESTING=OFF -D INJA_BUILD_TESTS=OFF -D INJA_USE_EMBEDDED_JSON=OFF ..
    make
}

package()
{
    # Assure that the directories exist.
    # shellcheck disable=SC2154
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ || exit
    make DESTDIR="${pkgdir}" install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
