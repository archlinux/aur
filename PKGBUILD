#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for EpubMerge.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="EpubMerge"

pkgname="epubmerge"
pkgver="2.17.0"
pkgrel="1"
pkgdesc="A tool for merging multiple epubs into one."
arch=("any")
url="https://github.com/JimmXinu/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("calibre" "python" "python-pyqt5" "python-setuptools" "python-six")
makedepends=("python-build" "python-installer")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("4ec627887c256fb7b71de17534cd7115ee9d3ab8ee9dfbbb15ddd1957c5f6f26e230c5305b4b904991165fd9be9ec0002597eb0e7bbfac1b5f144570596229e6")

prepare()
{
    chmod 755 "${srcdir}"/"${_pkgname}"-"${pkgver}"/epubmerge.py
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/lib/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/lib/"${pkgname}"/
    ln -s /usr/lib/"${pkgname}"/epubmerge.py "${pkgdir}"/usr/bin/epubmerge

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
