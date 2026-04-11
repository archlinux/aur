# Maintainer: ftk

_pkgname='mycoria'
pkgname="${_pkgname}-bin"
pkgver=0.5.7
pkgrel=1
pkgdesc="Open and secure overlay network that connects all participants"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mycoria/mycoria"
license=('BSD-3-Clause')
depends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${url}/raw/refs/tags/v${pkgver}/packaging/mycoria.service")
source_x86_64=("mycoria::${url}/releases/download/v${pkgver}/mycoria_linux_amd64")
source_aarch64=("mycoria::${url}/releases/download/v${pkgver}/mycoria_linux_arm64")
source_armv7h=("mycoria::${url}/releases/download/v${pkgver}/mycoria_linux_armv7")
sha256sums=('42f327e34fa0dfe431f91fc3049404ed3eeee38ba62c812e588c3ec8b8627ae8')
sha256sums_x86_64=('12c1013b4ad4c0d2693f3c5db777dbd50182977f233fdc5939cb7a21ee579be8')
sha256sums_aarch64=('12c1013b4ad4c0d2693f3c5db777dbd50182977f233fdc5939cb7a21ee579be8')
sha256sums_armv7h=('12c1013b4ad4c0d2693f3c5db777dbd50182977f233fdc5939cb7a21ee579be8')
backup=('opt/mycoria/config.yaml')
install=mycoria.install


pkgver() {
    {
    curl -Ssf "${url}/releases.atom" | grep '/releases/tag/' | sed -E 's@^.*/releases/tag/(.*)".*$@\1@; s@^v@@' | head -n 1 | grep '^[0-9][0-9\.]*$'
    } || echo "$pkgver"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"

    install -Dm755 "$srcdir/mycoria" "$pkgdir/opt/mycoria/mycoria"

    install -Dm644 "$srcdir/mycoria.service" "$pkgdir/usr/lib/systemd/system/mycoria.service"
}



_update_pkg() {
    curl -Ssf "${url}/releases.atom" | grep '/releases/tag/' | sed -E 's@^.*/releases/tag/(.*)".*$@\1@; s@^v@@' | head -n 1 | grep '^[0-9][0-9\.]*$'
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
