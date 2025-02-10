#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dl-librescore.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="dl-librescore"
pkgver="0.35.23"
pkgrel="1"
pkgdesc="Download sheet music from MuseScore."
arch=("any")
url="https://github.com/LibreScore/${pkgname}"
license=("MIT")
depends=("bash" "nodejs")
makedepends=("npm")
source=("${pkgname}-v${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-v${pkgver}.tgz")
sha512sums=("ce8d7340d1ce49de2fafa71c2bb71e49c601784186afb8adc550a9ccb1d7ecbeb4f966b6b1132118033321a6399580572d19e5ad0d4291d3541872c0efbca164")

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    npm install -g --prefix "${pkgdir}"/usr/ "${srcdir}"/"${pkgname}"-v"${pkgver}".tgz
    chown -R root:root "${pkgdir}"/

    # Install the documentation.
    ln -s /usr/lib/node_modules/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    ln -s /usr/lib/node_modules/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
