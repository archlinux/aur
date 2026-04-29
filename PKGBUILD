# Maintainer: ftk

_pkgname='mycoria'
pkgname="${_pkgname}-bin"
pkgver=0.5.5
pkgrel=1
pkgdesc="Open and secure overlay network that connects all participants"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mycoria/mycoria"
license=('BSD-3-Clause')
depends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${url}/raw/refs/tags/v${pkgver}/packaging/mycoria.service")
source_x86_64=("mycoria_x86_64::${url}/releases/download/v${pkgver}/mycoria_linux_amd64")
source_aarch64=("mycoria_aarch64::${url}/releases/download/v${pkgver}/mycoria_linux_arm64")
source_armv7h=("mycoria_armv7h::${url}/releases/download/v${pkgver}/mycoria_linux_armv7")
sha256sums=('42f327e34fa0dfe431f91fc3049404ed3eeee38ba62c812e588c3ec8b8627ae8')
sha256sums_x86_64=('4db3f941c2cbc5547fbc192acd9f73c7f57632309fee6a17d23ce985ea5a0ce7')
sha256sums_aarch64=('2adef0d78b1bd079b995233fecfa46f50174857a8b61460c6d1d143322cb11c3')
sha256sums_armv7h=('e02923ac87421c326e75f8ae61501d3f6049b8b9814ba500f88f735fb98bff7e')
backup=('opt/mycoria/config.yaml')
install=mycoria.install


package() {
    install -Dm755 "$srcdir/mycoria_${CARCH}" "$pkgdir/opt/mycoria/mycoria"

    install -Dm644 "$srcdir/mycoria.service" "$pkgdir/usr/lib/systemd/system/mycoria.service"
}



_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
