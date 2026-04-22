# Maintainer: ftk

_pkgname='usque'
pkgname="${_pkgname}-bin"
pkgver=3.0.0
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
sha256sums_x86_64=('fa5daff753d27f1c665b21a4f8548a34bfcf39904003845fc95c4fbf179effc2')
sha256sums_aarch64=('dc695e147c4c3f700a3dac48e65d12e7c47f024f51339097becf2f6d9f90b00e')
sha256sums_armv7h=('3b394915532cbe0b229ce57d38cba9d5d801bd493f122691afc4f76f39ebed05')
sha256sums_mips64=('22c7c88c52c57e1c90d763a8abe0a195dc9e237ca2e42a90fffdfa6a7e693729')
sha256sums_mips64el=('26a5830d6a12eab3c106ba97cf626ad8358d69d38ede62ebbbd0eb0e3765237b')


package() {
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
