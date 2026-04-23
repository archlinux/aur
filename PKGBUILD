#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Cake Wallet.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="cake_wallet"

pkgname="cake-wallet-bin"
pkgver="6.1.2"
pkgrel="1"
pkgdesc="A noncustodial multi-currency wallet."
arch=("x86_64")
url="https://github.com/cake-tech/${_pkgname}"
license=("MIT")
depends=("at-spi2-core" "cairo" "fontconfig" "gcc-libs" "gdk-pixbuf2" "glib2" "glibc" "gtk3" "harfbuzz" "libepoxy" "libgcrypt" "libgpg-error" "lz4" "pango" "util-linux-libs" "xz")
provides=("cake-wallet")
source=("${pkgname}-v${pkgver}-release.tar.xz::${url}/releases/download/v${pkgver}/Cake_Wallet_v${pkgver}_Linux.tar.xz"
    "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.desktop")
sha512sums=("c4ea2cc135a1d46c0086dd1f5a02dcbbaf594e6a44bf7f64c32ca704aead43d3c4f11d1c055d4a729a8cc38002f58e6fe0630554f3341980b8b19cf23ab80877"
    "31f28db08459c9c2a31a7ac760fa9b13757b3cf00050e2c08db65e4cd8b5d9b6289d0626ca46eb6195d30a85d07924865eff5bf3f38f017fd0bf64160271e443"
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
