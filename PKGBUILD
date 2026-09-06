# Maintainer: Klim Kostiuk <2601074@gmail.com>
pkgname=driftwm
pkgver=0.18.0
pkgrel=1
pkgdesc="Trackpad-first infinite canvas Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/malbiruk/driftwm"
license=('GPL-3.0-or-later')
depends=('libdisplay-info' 'libinput' 'seatd' 'mesa' 'libxkbcommon')
makedepends=('rust' 'cargo' 'pkg-config')
optdepends=(
    'xwayland-satellite: run X11 apps like Steam, Discord, and many games (needs >= 0.7)'
    'xdg-desktop-portal: screencasting and file pickers'
    'xdg-desktop-portal-wlr: screencast backend (OBS, Discord, browsers); or xdg-desktop-portal-cosmic'
    'grim: screenshots'
    'slurp: region selection for screenshots'
    'adwaita-fonts: Adwaita Sans SSD title bars matching GTK apps'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
