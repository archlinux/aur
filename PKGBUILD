#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for NostalgiaForInfinity.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="NostalgiaForInfinity"

pkgname="python-nostalgiaforinfinity"
pkgver="15.1.234"
pkgrel="1"
pkgdesc="Trading strategy for the Freqtrade crypto bot."
arch=("any")
url="https://github.com/iterativv/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("bash" "python" "python-attrs" "python-freqtrade" "python-numpy" "python-pandas" "python-pandas-ta" "python-pytest" "python-rapidjson" "python-ta-lib" "python-technical")
checkdepends=("git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("36a2115e2ab0f205d2e9bce620062ab1bed366c56a3494dc43265b4429e0cc2bddf9e9c0891d57e462da6af0766a5af06ae6fb3c1ffe12993911ef4c13643d41")

check()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    # "${srcdir}"/"${_pkgname}"-"${pkgver}"/tools/download-necessary-exchange-market-data-for-backtests.sh
    # pytest
    # rm -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/user_data/data/*
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/lib/"${_pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/
}
