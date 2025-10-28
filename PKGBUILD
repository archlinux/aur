#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Cake Wallet.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="cake_wallet"

pkgname="cake-wallet-bin"
pkgver="5.5.2"
pkgrel="1"
pkgdesc="A noncustodial multi-currency wallet."
arch=("x86_64")
url="https://github.com/cake-tech/${_pkgname}"
license=("MIT")
depends=("at-spi2-core" "cairo" "fontconfig" "gcc-libs" "gdk-pixbuf2" "glib2" "glibc" "gtk3" "harfbuzz" "libepoxy" "libgcrypt" "libgpg-error" "lz4" "pango" "util-linux-libs" "xz")
source=("${pkgname}-v${pkgver}-release.tar.xz::${url}/releases/download/v${pkgver}/Cake_Wallet_v${pkgver}_Linux.tar.xz"
    "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.desktop")
sha512sums=("36e403879acf2a5225b5f628d127bc3b244b4ccffa6867d9c7a798d02e998f28edb77a69026437003e9d892ebf1c8f10e59fa0fe014aea27d7a3ca22dfcddbc0"
    "e5a20f33928e0bbaad5ec6bb14a5b3c9e5bc49dcdc989328a0beeee4e9193f917f55465c130c6a48e1dfd8725c90fd10c8c6c5e24f976cf921736c72c6e98bb0"
    "5c023a15f0e6b6df6ca50192642c07b16697921bfe55fc657b0388123fb8cfc6dd90c6302fc417a2907d9c063084557b94df31617dc416bdc10041ad42359437")

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/opt/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/applications/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/pixmaps/

    # Install the software.
    cp -r "${srcdir}"/Cake_Wallet_v"${pkgver}"_Linux/* "${pkgdir}"/opt/"${pkgname}"/
    ln -s /opt/"${pkgname}"/"${_pkgname}" "${pkgdir}"/usr/bin/
    install -Dm644 "${srcdir}"/Cake_Wallet_v"${pkgver}"_Linux/data/flutter_assets/assets/images/cakewallet_logo.png "${pkgdir}"/usr/share/pixmaps/"${_pkgname}".png
    install -Dm644 "${srcdir}"/"${pkgname}".desktop "${pkgdir}"/usr/share/applications/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
