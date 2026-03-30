# Maintainer: Wayne Martin <ghwinslow1700@hotmail.com>
pkgname=waynewolf
pkgver=149.0
pkgrel=1
pkgdesc="Privacy-focused browser with profile templates and extension management based on LibreWolf/Firefox"
arch=('x86_64')
url="https://github.com/Wtmartin8089/WayneWolf"
license=('MPL2')
depends=(
    'gtk3'
    'dbus-glib'
    'ffmpeg'
    'nss'
    'ttf-font'
    'libpulse'
)
optdepends=(
    'networkmanager: For captive portal detection'
    'libnotify: For notification support'
)
provides=('waynewolf')
conflicts=('waynewolf-bin')
source=(
    "$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.en-US.linux-x86_64.tar.xz"
    "waynewolf.desktop::$url/raw/main/waynewolf.desktop"
    "waynewolf.svg::$url/raw/main/waynewolf.svg"
)
sha256sums=(
    '081093b281bc45377b08311740c8ee2c7aec73ef2d47c717bd9b3c96fa4cbd22'
    'SKIP'
    'SKIP'
)

package() {
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r "$srcdir/$pkgname/"* "$pkgdir/usr/lib/$pkgname/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
export MOZ_ENABLE_WAYLAND=1
export MOZ_REQUIRE_SIGNING=0
exec /usr/lib/waynewolf/waynewolf "$@"
EOF

    install -Dm644 "$srcdir/waynewolf.desktop" "$pkgdir/usr/share/applications/waynewolf.desktop"
    install -Dm644 "$srcdir/waynewolf.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/waynewolf.svg"
}
