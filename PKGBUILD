#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for EpubMerge.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="EpubMerge"

pkgname="epubmerge"
pkgver="3.2.0"
pkgrel="1"
pkgdesc="A tool for merging multiple epub files into one."
arch=("any")
url="https://github.com/JimmXinu/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("python" "python-six")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("089cf8031d13c9a84a6fc35a43ac02a9232948dd8bd61f70b35db9f65c3b50349ad6926541261ec8849d15f6e259792cf14ae186990c20d0cdd2c41d54092f2e")

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
