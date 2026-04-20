# Maintainer: viewerofal <joemomanugget@gmail.com>
pkgname=woven-shell-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Complete Wayland shell for Sway — bar, launcher, lock screen, wallpaper, power menu, control center, config manager, and OSD"
arch=('x86_64')
url="https://github.com/viewerofall/woven-shell"
license=('MIT')
depends=('sway' 'wireplumber' 'brightnessctl' 'playerctl' 'swaync' 'pam')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/viewerofall/woven-shell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe152fb39c4bfc13fab2bd284774c570931d8ab40efd1c35d2f13f9afb5ceae8')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    local bins=(woven-bar woven-power woven-cc woven-launch woven-lock woven-wall woven-pick woven-cfg woven-osd)
    for bin in "${bins[@]}"; do
        install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    done

    install -d "$pkgdir/usr/share/woven-shell/config"
    cp config/*.toml "$pkgdir/usr/share/woven-shell/config/"

    install -Dm644 get.sh "$pkgdir/usr/share/woven-shell/get.sh"
}
