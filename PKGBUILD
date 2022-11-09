#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dl-librescore.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="dl-librescore"
pkgver="0.34.26"
pkgrel="1"
pkgdesc="Download sheet music from MuseScore."
arch=("any")
url="https://github.com/LibreScore/${pkgname}"
license=("MIT")
depends=("bash" "nodejs")
makedepends=("npm")
source=("${pkgname}-v${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-v${pkgver}.tgz")
sha512sums=("729c40474b81ba4b1997f433a5cf333a118bb27aa8be9593e08c076d5df3f8fe8dea4ce6fc619c82c115ed241744dec59fe99b5a0f2abe0b49b51bb82d07b029")

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
