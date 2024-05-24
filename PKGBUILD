#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for NostalgiaForInfinity.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="NostalgiaForInfinity"

pkgname="python-nostalgiaforinfinity"
pkgver="14.1.755"
pkgrel="1"
pkgdesc="Trading strategy for the Freqtrade crypto bot."
arch=("any")
url="https://github.com/iterativv/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("bash" "python" "python-attrs" "python-freqtrade" "python-numpy" "python-pandas" "python-pandas-ta" "python-pytest" "python-rapidjson" "python-ta-lib" "python-technical")
checkdepends=("git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("e838b22c00235a55f2d12e20475a64c1c18aa1a14c131c2117b6f81a6c3723fbd99e0048d4ca7b7b3377e3a02a1cd1649ddc3b77bc4cd8f2ba89b797894a069f")

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
