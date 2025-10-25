#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dl-librescore.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="dl-librescore"
pkgver="0.35.34"
pkgrel="1"
pkgdesc="Download sheet music from MuseScore."
arch=("any")
url="https://github.com/LibreScore/${pkgname}"
license=("MIT")
depends=("bash" "nodejs")
makedepends=("npm")
source=("${pkgname}-v${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-v${pkgver}.tgz")
sha512sums=("461e38f04de71cf529af3bfc53eb7231780cb4e4ce8212b9773fc46de96e3946313ac650217569db071ce073eb5f5366facffa5dfff2099f031063efea830aaa")

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
