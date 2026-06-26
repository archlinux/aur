# Maintainer: shorin <2433516202@qq.com>
pkgname=wl-longshot-git
pkgver=r46.4df957f
pkgrel=1
pkgdesc="A scrolling screenshot tool (long screenshot tool) for Wayland Compositors"
arch=('x86_64')
url="https://github.com/SHORiN-KiWATA/wl-longshot"
license=('GPL3') 

depends=(
    'bash' 'grim' 'slurp' 'wl-clipboard' 'wayland'
)
makedepends=(
    'git' 'cargo' 'rust'
)
optdepends=(
    'satty: Post-capture editing'
    'xdg-utils: For opening images in default viewer'
    'fuzzel: Menu UI for wrapper mode'
    'rofi: Alternative menu UI for wrapper mode'
    'wofi: Alternative menu UI for wrapper mode'
)
provides=('wl-longshot')
conflicts=('wl-longshot')
source=("git+https://github.com/SHORiN-KiWATA/wl-longshot.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wl-longshot"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/wl-longshot"
    cargo build --release
}

package() {
    cd "$srcdir/wl-longshot"

    install -Dm755 target/release/wl-longshot "$pkgdir/usr/bin/wl-longshot"
    install -Dm755 wl-longshot-menu "$pkgdir/usr/bin/wl-longshot-menu"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
