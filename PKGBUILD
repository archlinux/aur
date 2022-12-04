#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dl-librescore.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="dl-librescore"
pkgver="0.34.28"
pkgrel="1"
pkgdesc="Download sheet music from MuseScore."
arch=("any")
url="https://github.com/LibreScore/${pkgname}"
license=("MIT")
depends=("bash" "nodejs")
makedepends=("npm")
source=("${pkgname}-v${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-v${pkgver}.tgz")
sha512sums=("feff0bba4a2e10f906c70f3ce4d20e829323adc0b45471d4691d8fce9a07436ba22a65ee95e9f21a429ebab8f40a683a0ea61ae8f864964d1292b5ef1ba88af1")

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
