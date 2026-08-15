#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for j2lint.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="j2lint"
pkgver="1.3.0"
pkgrel="1"
pkgdesc="Jinja2 linter."
arch=("any")
url="https://github.com/aristanetworks/${pkgname}"
license=("MIT")
depends=("python" "python-jinja" "python-rich")
makedepends=("python-build" "python-installer" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-cov" "python-typing_extensions")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("aeacf31a33d9a5734f6c595d7c9efb67b455101756a4e8902e9ec40d45087c54b3970c1c14cbaa1fa99d8daca0be537ce78ad5b7585169f2cc44349dbe8c9528")

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
