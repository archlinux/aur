#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for NostalgiaForInfinity.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="NostalgiaForInfinity"
declare -r _tag="68da5afb75a42d3111b2e276c213558b851c7949"

pkgname="python-nostalgiaforinfinity"
pkgver="12.0.435"
pkgrel="1"
pkgdesc="Trading strategy for the Freqtrade crypto bot."
arch=("any")
url="https://github.com/iterativv/${_pkgname}"
license=("GPL3")
depends=("bash" "python" "python-freqtrade" "python-numpy" "python-pandas" "python-pandas-ta" "python-rapidjson" "python-ta-lib" "python-technical")
makedepends=("git")
checkdepends=("python-pytest" "python-pytest-mock" "python-pytest-subtests")
source=("${pkgname}::git+${url}.git?#tag=${_tag}"
    "git+https://github.com/iterativv/NostalgiaForInfinityData")
sha512sums=("SKIP"
    "SKIP")

prepare()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    git submodule init

    git config submodule.user_data/data.url "${srcdir}"/NostalgiaForInfinityData/

    git -c protocol.file.allow=always submodule update
}

# TODO
#check()
#{
#    cd "${srcdir}"/"${pkgname}"/ || exit 1
#    pytest
#}

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
