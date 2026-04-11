# Maintainer: ftk

_pkgname='usque'
pkgname="${_pkgname}-bin"
pkgver=2.0.1
pkgrel=1
pkgdesc="Open-source reimplementation of the Cloudflare WARP client's MASQUE protocol"
arch=('x86_64' 'aarch64' 'armv7h' 'mips64' 'mips64el')
url="https://github.com/Diniboy1123/usque"
license=('MIT')
depends=()
provides=(${_pkgname} ${_pkgname})
conflicts=(${_pkgname} ${_pkgname})
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.zip")
source_mips64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64.zip")
source_mips64el=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le.zip")
sha256sums_x86_64=('c87b0076e3e98d5ff68215a850473be3c7a51f92767a08ee3c525fefafc67df5')
sha256sums_aarch64=('cd7fb2fbb2df608423c0e92bc6ede49ea61fd98e061f49d3d071129f45b7996a')
sha256sums_armv7h=('702bfeaa45b4885bd34e2fb661ea370ca3cf1f547c431790ed99c36765f8cb14')
sha256sums_mips64=('9d97753beba9b1fac207e0718e94c712099ebb8f26d30d125e347472061244a7')
sha256sums_mips64el=('ab6425517e1d19763189ac4d09d5a40f8eca6c3b8220cea7fb8048cc9f093f21')


package() {
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | grep '/releases/tag/' | sed -E 's@^.*/releases/tag/(.*)".*$@\1@; s@^v@@' | head -n 1 | grep '^[0-9][0-9\.]*$'
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
