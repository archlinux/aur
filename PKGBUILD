#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dl-librescore.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="dl-librescore"
pkgver="0.34.46"
pkgrel="1"
pkgdesc="Download sheet music from MuseScore."
arch=("any")
url="https://github.com/LibreScore/${pkgname}"
license=("MIT")
depends=("bash" "nodejs")
makedepends=("npm")
source=("${pkgname}-v${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-v${pkgver}.tgz")
sha512sums=("2fc008a317597d1ad6010ff69c423bde829ce9b1fc12b8d5315f713aa6d81f172af08f3a5cb34a3296d23955056f9a8985c715d00b673855cf0f53aea10230f9")

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
