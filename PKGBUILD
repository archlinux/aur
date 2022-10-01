#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="keysmith"
pkgver="22.09"
pkgrel="1"
pkgdesc="OTP client for Plasma Mobile and Desktop."
arch=("any")
url="https://invent.kde.org/utilities/${pkgname}"
license=("GPL3")
makedepends=("cmake" "extra-cmake-modules" "frameworkintegration" "kirigami2" "libsodium" "qt5-base" "qt5-quickcontrols2")
conflicts=("keysmith-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=("e96236ba7d3b46aef111433eaef3907ec658d3d08ad211f746c0c81391b2d94d50a1e2be31f03823722af61b0b57fe9c7f64f76b06d8bf8f50d9a389f033f2db")

build()
{
    mkdir -p "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/
    cd "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/ || exit 1
    cmake ..
    make
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"-v"${pkgver}"/build/ || exit 1
    make DESTDIR="${pkgdir}"/ install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-v"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
