# Maintainer: Shorin <shorin@example.com>
_pkgname=clipsync
pkgname=clipsync-git
pkgver=v1.1.0.r7.48ce557
pkgrel=2
pkgdesc="Clipboard synchronization script for Wayland Compositor (X11 <--> Wayland)"
arch=('any')
url="https://github.com/SHORiN-KiWATA/clipsync"
license=('MIT')
depends=('xclip' 'wl-clipboard' 'clipnotify')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP') 

pkgver() {
    cd "$_pkgname"
    printf "v1.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd "$_pkgname"

    # 1. 安装 3 个脚本到 /usr/bin
    install -Dm755 clipsync     "${pkgdir}/usr/bin/clipsync"
    install -Dm755 clipsync-x2w "${pkgdir}/usr/bin/clipsync-x2w"
    install -Dm755 clipsync-w2x "${pkgdir}/usr/bin/clipsync-w2x"

    # 2. 安装 Systemd 服务
    install -Dm644 clipsync.service "${pkgdir}/usr/lib/systemd/user/clipsync.service"
}
