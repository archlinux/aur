#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for EpubMerge.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="EpubMerge"

pkgname="epubmerge"
pkgver="3.1.0"
pkgrel="1"
pkgdesc="A tool for merging multiple epub files into one."
arch=("any")
url="https://github.com/JimmXinu/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("calibre" "python" "python-pyqt5" "python-setuptools" "python-six")
makedepends=("python-build" "python-installer" "python-wheel")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("5ce47bff3f798e9c1117e7e3ab08007d688e4ce548b8e6cef14968adaa68b921aeb5b34bde14e237cb7d00bb00b7f98915df8b3f577e8466c434c7678edfb0a7")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"-"${pkgver}"/dist/*.whl

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
