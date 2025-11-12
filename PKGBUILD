# Maintainer: VintageTechie <https://vintagetechie.com>
pkgname=cosmic-updates-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal package update checker applet for COSMIC Desktop with AUR support (git)"
arch=('x86_64')
url="https://github.com/VintageTechie/cosmic-updates"
license=('MIT')
depends=('cosmic-panel')
makedepends=('git' 'rust' 'cargo')
optdepends=(
    'pacman: For Arch-based package management'
    'checkupdates: For checking Pacman updates'
    'paru: For AUR package support (preferred)'
    'yay: For AUR package support'
)
provides=('cosmic-updates')
conflicts=('cosmic-updates' 'cosmic-updates-bin')
source=("git+https://github.com/VintageTechie/cosmic-updates.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/cosmic-updates"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/cosmic-updates"
    cargo build --release
}

package() {
    cd "$srcdir/cosmic-updates"
    
    # Install binary
    install -Dm755 "target/release/cosmic-updates" \
        "$pkgdir/usr/bin/cosmic-updates"
    
    # Install desktop file
    install -Dm644 "com.vintagetechie.CosmicUpdates.desktop" \
        "$pkgdir/usr/share/applications/com.vintagetechie.CosmicUpdates.desktop"
    
    # Install icons
    install -Dm644 "icons/hicolor/scalable/apps/tux-normal.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-normal.svg"
    install -Dm644 "icons/hicolor/scalable/apps/tux-alert.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tux-alert.svg"
}
