# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-ext-applet-updates-git
pkgver=1.1.0
pkgrel=2
pkgdesc="Updates Applet for COSMIC Desktop (community extension)"
arch=('x86_64')
url="https://github.com/VintageTechie/cosmic-ext-applet-updates"
license=('MIT')
depends=('cosmic-panel' 'pacman-contrib')
makedepends=('rust' 'cargo' 'git')
optdepends=(
    'paru: For AUR support (preferred)'
    'yay: For AUR support (alternative)'
)
provides=('cosmic-ext-applet-updates')
conflicts=('cosmic-ext-applet-updates' 'cosmic-ext-applet-updates-bin')
source=("git+https://github.com/VintageTechie/cosmic-ext-applet-updates.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/cosmic-ext-applet-updates"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/cosmic-ext-applet-updates"
    cargo build --release --locked
}

package() {
    cd "$srcdir/cosmic-ext-applet-updates"
    
    install -Dm755 "target/release/cosmic-ext-applet-updates" \
        "$pkgdir/usr/bin/cosmic-ext-applet-updates"
    
    install -Dm644 "com.vintagetechie.CosmicExtAppletUpdates.desktop" \
        "$pkgdir/usr/share/applications/com.vintagetechie.CosmicExtAppletUpdates.desktop"
    
    install -Dm644 "icons/hicolor/scalable/apps/tux-normal.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-normal.svg"
    install -Dm644 "icons/hicolor/scalable/apps/tux-alert.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-alert.svg"
    
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
