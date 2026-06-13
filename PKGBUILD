# Maintainer: ftk

_pkgname='usque'
pkgname="${_pkgname}-bin"
pkgver=3.0.1
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
sha256sums_x86_64=('a4666c1901d81be76c7b03d15f8736b12b5c96906f28c3ce15f482da1cf2b429')
sha256sums_aarch64=('7ded36a31868697995ca91d5c8e31405f03a1164583363daeacd64d34f0dfe4c')
sha256sums_armv7h=('075abb62e35f440950ffb42f8ace9ee9e63dec6e558017b484b7b0709d4c05dd')
sha256sums_mips64=('888c328a172a57fe2bdc6851d3f3d41d1c3b8b05cad2235c2731969632a9ee7c')
sha256sums_mips64el=('1f7dd29fa6d3538c2904e34e96dbace3766d57ac37bde2da094df019e2c74740')


package() {
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
