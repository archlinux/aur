#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname=keysmith
pkgver=21.07
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
epoch=
# shellcheck disable=SC2034
pkgdesc="OTP client for Plasma Mobile and Desktop."
# shellcheck disable=SC2034
arch=("any")
url="https://invent.kde.org/utilities/${pkgname}"
# shellcheck disable=SC2034
license=("GPL3")
# shellcheck disable=SC2034
groups=()
# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
makedepends=("cmake" "extra-cmake-modules" "frameworkintegration" "gcc" "kirigami2" "libsodium" "make" "qt5-base" "qt5-quickcontrols2")
# shellcheck disable=SC2034
checkdepends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=()
# shellcheck disable=SC2034
conflicts=("keysmith-git")
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
source=("${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
# shellcheck disable=SC2034
noextract=()
# shellcheck disable=SC2034
md5sums=("37a5ca6f55ffdd58adf88be1d106b72e")
# shellcheck disable=SC2034
validpgpkeys=()

build()
{
    # shellcheck disable=SC2154
    mkdir -p "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/
    cd "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/ || exit
    cmake ..
    make
}

package()
{
    # Assure that the directories exist.
    # shellcheck disable=SC2154
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/ || exit
    make DESTDIR="${pkgdir}" install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-v"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-v"${pkgver}"/LICENSES/GPL-3.0-or-later.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
