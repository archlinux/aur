#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="keysmith"
pkgver="22.06"
pkgrel="1"
pkgdesc="OTP client for Plasma Mobile and Desktop."
arch=("any")
url="https://invent.kde.org/utilities/${pkgname}"
license=("GPL3")
makedepends=("cmake" "extra-cmake-modules" "frameworkintegration" "kirigami2" "libsodium" "qt5-base" "qt5-quickcontrols2")
conflicts=("keysmith-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=("28155d4aa7fe9af3fc6de7eab7d9ef2cfc21ed5bccff0b3416fea09158753c939c5a32ab7928b2e529a0f1228cab77d0745aeaf81dcf3c47a6bac8694c9493f8")

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
