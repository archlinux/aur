#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for j2lint.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="j2lint"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="Jinja2 linter."
arch=("any")
url="https://github.com/aristanetworks/${pkgname}"
license=("MIT")
depends=("python" "python-jinja" "python-rich")
makedepends=("python-build" "python-installer" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-cov")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("e707057ad2487460cd607cf825f2369131df1004f88fd3299cd0494b98a3270587fb11a5a6e0627f3b1cb069ed69522c65b76cf1bf42c73460165f204f6fb8eb")

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

check()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    pytest
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    python -m installer -d "${pkgdir}" "${srcdir}"/"${pkgname}"-"${pkgver}"/dist/*.whl

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
