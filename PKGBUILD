# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper"
pkgver=2.0.1
pkgrel=1
pkgdesc="Native translation layer for Wallpaper Engine on Linux"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('dbus')
optdepends=('fontconfig: local font overrides for Wallpaper Engine content'
            'proton: required to run wallpaper64.exe under Wallpaper Engine'
            'wallpiper-gnome: GNOME (Mutter) portal'
            'wallpiper-kde: KDE Plasma portal'
            'wallpiper-hyprland: Hyprland portal'
            'wallpiper-sway: Sway portal'
            'wallpiper-cosmic: COSMIC portal'
            'wallpiper-i3: i3wm portal')
makedepends=('git' 'dbus' 'vulkan-headers')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make build-core
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 build/release/wallpiperd "$pkgdir/usr/lib/wallpiper/wallpiperd"
    install -Dm755 build/release/wallpiperctl "$pkgdir/usr/lib/wallpiper/wallpiperctl"
    install -Dm755 build/release/libwallpiper-preload.so "$pkgdir/usr/lib/wallpiper/libwallpiper-preload.so"
    install -Dm755 build/release/libVkLayer_wallpiper_capture.so "$pkgdir/usr/lib/wallpiper/libVkLayer_wallpiper_capture.so"
    install -Dm644 build/release/dwmapi.dll "$pkgdir/usr/lib/wallpiper/dwmapi.dll"

    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/wallpiper/wallpiperd "$pkgdir/usr/bin/wallpiperd"
    ln -s /usr/lib/wallpiper/wallpiperctl "$pkgdir/usr/bin/wallpiperctl"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
