#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for DataSieve.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="datasieve"

pkgname="python-datasieve"
pkgver="0.1.9"
pkgrel="1"
pkgdesc="Adding coherence to the SKLearn pipeline."
arch=("any")
url="https://github.com/emergentmethods/${_pkgname}"
license=("MIT")
depends=("python" "python-pandas" "python-scikit-learn")
makedepends=("python-build" "python-installer" "python-poetry-core" "python-wheel")
checkdepends=("python-pytest")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("02991e8246f3a8098cda7c80b07488ddb09226af04df90b4ea3b3a2224ebe507a0a101a0476f38591d0eea2a12452a07caff7da03a5257a665b84ec304fedac8")

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
