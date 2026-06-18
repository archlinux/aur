# Maintainer: ftk

_pkgname='usque'
pkgname="${_pkgname}-bin"
pkgver=4.1.0
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
sha256sums_x86_64=('0593dffb1fa3e6d428f9cfc70e38690247667c7d16642830e987776c8a91d3bb')
sha256sums_aarch64=('653a3fe85e309eb664a2eaa259294ff71db5698fab163c28c7e0fd96036569ca')
sha256sums_armv7h=('e652e95e83ae233c6814cad7662b4d8efa74305df1f521eadde80b7b2c55731a')
sha256sums_mips64=('68a3b4660e31d2180fa2c8f63e1aa811c9374d76402737f6873d2c8e65dd7a99')
sha256sums_mips64el=('a67832fa5f2079118f425a838fbb8eab1d66233b201c701cf5277d6318657de8')


package() {
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
