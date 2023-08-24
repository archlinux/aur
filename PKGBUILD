#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for NostalgiaForInfinity.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="NostalgiaForInfinity"
declare -r _tag="3d09bb20a37c930d6005512dfbe7ab5b3b398196"

pkgname="python-nostalgiaforinfinity"
pkgver="13.0.416"
pkgrel="1"
pkgdesc="Trading strategy for the Freqtrade crypto bot."
arch=("any")
url="https://github.com/iterativv/${_pkgname}"
license=("GPL3")
depends=("bash" "python" "python-freqtrade" "python-numpy" "python-pandas" "python-pandas-ta" "python-rapidjson" "python-ta-lib" "python-technical")
makedepends=("git")
checkdepends=("python-ast-comments" "python-pytest" "python-pytest-mock" "python-pytest-pretty" "python-pytest-subtests" "python-pytest-xdist")
source=("${pkgname}::git+${url}.git?#tag=${_tag}")
sha512sums=("SKIP")

check()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    pytest
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"/* "${pkgdir}"/usr/lib/"${_pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/
}
