#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Cake Wallet.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="cake_wallet"

pkgname="cake-wallet-bin"
pkgver="4.12.1"
pkgrel="1"
pkgdesc="A noncustodial multi-currency wallet."
arch=("x86_64")
url="https://github.com/cake-tech/${_pkgname}"
license=("MIT")
depends=("at-spi2-core" "cairo" "fontconfig" "gcc-libs" "gdk-pixbuf2" "glib2" "glibc" "gtk3" "harfbuzz" "libepoxy" "libgcrypt" "libgpg-error" "lz4" "pango" "util-linux-libs" "xz")
source=("${pkgname}-v${pkgver}-release.tar.xz::${url}/releases/download/v${pkgver}/Cake_Wallet_v${pkgver}_Linux.tar.xz"
    "${_pkgname}.desktop"
    "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("5e94b1e2aca476343f8e7a36d01a217128c2c60f989ba63229c2d610733df8b18bd9509d73c59645614bed705b6baa968b1873a70d640ceb58dc08c4b6da7204"
    "5c023a15f0e6b6df6ca50192642c07b16697921bfe55fc657b0388123fb8cfc6dd90c6302fc417a2907d9c063084557b94df31617dc416bdc10041ad42359437"
    "50020f7d68335ab99e8721849b461a61753d948368db84baa2a44f1257c573d600dee511afa4c1ac7ee3335d7d357ba10d0a91ae119df112a3d9eccdab8fe2cf")

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/opt/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/applications/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/Cake_Wallet_v"${pkgver}"_Linux/* "${pkgdir}"/opt/"${_pkgname}"/
    ln -s /opt/"${_pkgname}"/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
    install -Dm644 "${srcdir}"/Cake_Wallet_v"${pkgver}"_Linux/data/flutter_assets/assets/images/cakewallet_logo.png "${pkgdir}"/usr/share/pixmaps/"${pkgname}".png
    install -Dm644 "${srcdir}"/"${_pkgname}".desktop "${pkgdir}"/usr/share/applications/"${_pkgname}".desktop

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
