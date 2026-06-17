# Maintainer: ftk

_pkgname='usque'
pkgname="${_pkgname}-bin"
pkgver=4.0.0
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
sha256sums_x86_64=('77e4512e4980b4e1f4c33aa68cb739eee49cdd0621369a35da0a5d4bf0ef495d')
sha256sums_aarch64=('698009731163045694bad8a03a13f21a88ca3d96fdd6471f5c394741ec1dbccd')
sha256sums_armv7h=('df19fe4b0d3f5c43ba81ebdfa533caffaa67c0b2038d289413f0e8225af2c63b')
sha256sums_mips64=('c4ff2ce8d7a0c2721317af4eafe66d527aaba5b0db808cb7648e0fdf3de07489')
sha256sums_mips64el=('896cf6c7563eb20c61a7a6855065432e5bf46f157907fb431b9322459a745aa5')


package() {
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
