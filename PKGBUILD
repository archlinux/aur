# Maintainer: comalot
_pkgname=clipsync
pkgname=comalot-clipsync-git
pkgver=v1.2.0.r1.b15752b
pkgrel=1
pkgdesc="Wayland <-> X11 clipboard sync for xwayland-satellite compositors (niri, Hyprland)"
arch=('any')
url="https://github.com/123hi123/clipsync"
license=('MIT')
depends=('xclip' 'wl-clipboard' 'clipnotify' 'xxhash')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" 'clipsync-git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "v1.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -Dm755 clipsync     "${pkgdir}/usr/bin/clipsync"
    install -Dm755 clipsync-x2w "${pkgdir}/usr/bin/clipsync-x2w"
    install -Dm755 clipsync-w2x "${pkgdir}/usr/bin/clipsync-w2x"
    install -Dm644 clipsync.service "${pkgdir}/usr/lib/systemd/user/clipsync.service"
}
