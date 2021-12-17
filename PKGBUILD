#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname=keysmith
pkgver=21.12
pkgrel=1
pkgdesc="OTP client for Plasma Mobile and Desktop."
arch=("any")
url="https://invent.kde.org/utilities/${pkgname}"
license=("GPL3")
makedepends=("cmake" "extra-cmake-modules" "frameworkintegration" "gcc" "kirigami2" "libsodium" "make" "qt5-base" "qt5-quickcontrols2")
conflicts=("keysmith-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=("2c6a8befbdf39593cc743c168d9a6c77d2715dcf2e652ab738c655a900487860")

build()
{
    mkdir -p "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/
    cd "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/ || exit
    cmake ..
    make
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/ || exit
    make DESTDIR="${pkgdir}" install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-v"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
