#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for EpubMerge.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="EpubMerge"

pkgname="epubmerge"
pkgver="3.3.0"
pkgrel="1"
pkgdesc="A tool for merging multiple epub files into one."
arch=("any")
url="https://github.com/JimmXinu/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("python" "python-six")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("50a9250f27bd3fffdf09b2ea53ce50b1d43ca13a2354aeda643b91bd905c0cd46ce3bbf98c99a9eba3e2df8dc06519dbdaefd9e276309ca3781927f8d899afc3")

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
