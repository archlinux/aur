#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for DataSieve.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="datasieve"

pkgname="python-datasieve"
pkgver="0.1.8"
pkgrel="1"
pkgdesc="Adding coherence to the SKLearn pipeline."
arch=("any")
url="https://github.com/emergentmethods/${_pkgname}"
license=("MIT")
depends=("python" "python-pandas" "python-scikit-learn")
makedepends=("python-build" "python-installer" "python-poetry-core" "python-wheel")
checkdepends=("python-pytest")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("1a7a599bf24c24f08b585ccc32491587a320cedf770db05a95618ba87e97ef751fc36331856563b730193086150171d5279fa8c3c1fcaedc13f08382b55f6d61")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    # -n cannot be used as Python files will be missing.
    python -m build -w
}

check()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    # TODO
    # pytest
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"-"${pkgver}"/dist/*.whl

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
