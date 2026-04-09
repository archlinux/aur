#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for NostalgiaForInfinity.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="NostalgiaForInfinity"

pkgname="python-nostalgiaforinfinity"
pkgver="17.3.1079"
pkgrel="1"
pkgdesc="Trading strategy for the Freqtrade crypto bot."
arch=("any")
url="https://github.com/iterativv/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("bash" "python" "python-attrs" "python-freqtrade" "python-numpy" "python-pandas" "python-pandas-ta" "python-pytest" "python-rapidjson" "python-ta-lib" "python-technical")
checkdepends=("git" "python-pytest")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("f52a111b6b16a7185f95a310899ed5e532447638b0880e38ac6929af7fad22f4d999642e442f0219b48bad011235eeccf0b5e85883906e72f4ac058580a48367")

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
