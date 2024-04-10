#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for EpubMerge.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="EpubMerge"

pkgname="epubmerge"
pkgver="2.18.0"
pkgrel="1"
pkgdesc="A tool for merging multiple epub files into one."
arch=("any")
url="https://github.com/Spixmaster/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("calibre" "python" "python-pyqt5" "python-setuptools" "python-six")
makedepends=("git" "python-build" "python-installer")
#source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source=("${_pkgname}::git+${url}.git")
#sha512sums=("ce0e9dcaa8e8d978442ae5a066ff7e4ca46bdb5fe7a71784151202688571a623dda12a83f17358a3133bbae430c9dfe2704caacbe32af2250b1513840cccec34")
sha512sums=("SKIP")

build()
{
    # cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    python -m build -nw
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    # python -m installer -d "${pkgdir}" "${srcdir}"/"${pkgname}"-"${pkgver}"/dist/*.whl
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"/dist/*.whl

    # Install the documentation.
    # install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
