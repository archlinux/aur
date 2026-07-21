# Maintainer: ftk

_pkgname='usque'
pkgname="${_pkgname}-bin"
pkgver=4.2.1
pkgrel=1
pkgdesc="Open-source reimplementation of the Cloudflare WARP client's MASQUE protocol"
arch=('x86_64' 'aarch64' 'armv7h' 'mips64' 'mips64el')
url="https://github.com/Diniboy1123/usque"
license=('MIT')
depends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.zip")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64.zip")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le.zip")
sha256sums_x86_64=('4117e20695078af9c11edecd1a826c009bbc7ea0b7f64458612b4198910bc313')
sha256sums_aarch64=('c88b061c2a567f30813d7505637d1fb6fe7ec5898b5b61fd05122409fa5ad925')
sha256sums_armv7h=('5e0025f6298d3822ef13b85960fc7c5845f8510e1ddd088ea87ea0f00d39cc88')
sha256sums_mips64=('59e65094f81f8a4fbe9bbdc6d3b4b99ef15cbe38793c9530f0bdd4223b432546')
sha256sums_mips64el=('20b3fa8ab1f7cc5dd99ea9106deddbd6c52a5bbe89385bcf21b090f4aad4ccd8')


package() {
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
