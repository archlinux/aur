#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="keysmith"
pkgver="22.02"
pkgrel="1"
pkgdesc="OTP client for Plasma Mobile and Desktop."
arch=("any")
url="https://invent.kde.org/utilities/${pkgname}"
license=("GPL3")
makedepends=("cmake" "extra-cmake-modules" "frameworkintegration" "kirigami2" "libsodium" "qt5-base" "qt5-quickcontrols2")
conflicts=("keysmith-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=("cbe83085b08ba3d9643eb145bb405644f6b45dbcbef5dc99ede138efe6438cb0eca2cf166de83623fb14d836c01262176def072190376de3d164809f2afca5b9")

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
