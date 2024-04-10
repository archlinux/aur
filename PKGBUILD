#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for EpubMerge.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="EpubMerge"

pkgname="epubmerge"
pkgver="3.0.0"
pkgrel="1"
pkgdesc="A tool for merging multiple epub files into one."
arch=("any")
url="https://github.com/JimmXinu/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("calibre" "python" "python-pyqt5" "python-setuptools" "python-six")
makedepends=("git" "python-build" "python-installer")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("a83aa3f00ddbd342b6d76bb6d2bec670f1ec59611d579faa325222308fe1afc38df976da0819a4055cfe781642726561b100fd52b5a62bab5997432869739cb2")

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    python -m installer -d "${pkgdir}" "${srcdir}"/"${pkgname}"-"${pkgver}"/dist/*.whl

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
