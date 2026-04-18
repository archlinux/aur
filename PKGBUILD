# Maintainer: tutkuofnight <https://github.com/tutkuofnight>
pkgname=lycan-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Lightweight PWA manager for Linux desktops"
arch=('x86_64')
url="https://github.com/tutkuofnight/lycan"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2')
makedepends=('rust' 'git' 'pkg-config')
provides=('lycan')
conflicts=('lycan')
source=("git+https://github.com/tutkuofnight/lycan.git")
sha256sums=('SKIP')

pkgver() {
    cd lycan
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd lycan
    cargo build --release --locked
}

package() {
    cd lycan
    install -Dm755 "target/release/lycan" "$pkgdir/usr/bin/lycan"
    install -Dm644 "data/io.github.tutkuofnight.Lycan.desktop" "$pkgdir/usr/share/applications/io.github.tutkuofnight.Lycan.desktop"
    install -Dm644 "data/io.github.tutkuofnight.Lycan.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.tutkuofnight.Lycan.metainfo.xml"
    install -Dm644 "assets/lycan.png" "$pkgdir/usr/share/pixmaps/io.github.tutkuofnight.Lycan.png"
}
