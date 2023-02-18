#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for NostalgiaForInfinity.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="NostalgiaForInfinity"
declare -r _tag="e6d005ad8449065a90c8e7cd30cf9e26e2332655"

pkgname="python-nostalgiaforinfinity"
pkgver="12.0.142"
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
