# Maintainer: godlyfast <godlyfast@gmail.com>
pkgname=hyprwave-hifi
pkgver=0.5.1
pkgrel=1
pkgdesc="HyprWave Hi-Fi Edition - Enhanced MPRIS media controller for Wayland with interactive seek, player switching, and notifications"
arch=('x86_64')
url="https://github.com/godlyfast/hyprwave"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('gcc' 'pkgconf')
provides=('hyprwave')
conflicts=('hyprwave' 'hyprwave-hifi-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/godlyfast/hyprwave/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "hyprwave-$pkgver"
    make
}

package() {
    cd "hyprwave-$pkgver"

    # Install binary
    install -Dm755 hyprwave "$pkgdir/usr/bin/hyprwave"

    # Install toggle script
    install -Dm755 hyprwave-toggle.sh "$pkgdir/usr/bin/hyprwave-toggle"

    # Install data files
    install -Dm644 style.css "$pkgdir/usr/share/hyprwave/style.css"

    # Install icons
    install -dm755 "$pkgdir/usr/share/hyprwave/icons"
    install -m644 icons/*.svg "$pkgdir/usr/share/hyprwave/icons/"

    # Install themes
    install -dm755 "$pkgdir/usr/share/hyprwave/themes"
    install -m644 themes/*.css "$pkgdir/usr/share/hyprwave/themes/"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
