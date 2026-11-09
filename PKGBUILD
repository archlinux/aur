# Maintainer: Qingxu <me@linioi.com>
pkgname=herdr-app-bin
pkgver=0.1.14
pkgrel=1
pkgdesc='Native desktop workspace for terminals and coding agents that keep running'
url='https://herdr.dev'
arch=(
    'x86_64'
    'aarch64'
)
license=(
    'Apache-2.0'
)
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libglvnd'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'vulkan-icd-loader'
    'wayland'
    'herdr-core>=0.1.11'
)
provides=(
    "${pkgname%-bin}=$pkgver"
)
conflicts=(
    "${pkgname%-bin}"
)
options=(
    '!strip'
    '!debug'
)
source_x86_64=(
    "$pkgname-$pkgver-x86_64.tar.gz::https://releases.herdr.dev/app/$pkgver/herdr-app-linux-x86_64.tar.gz"
)
source_aarch64=(
    "$pkgname-$pkgver-aarch64.tar.gz::https://releases.herdr.dev/app/$pkgver/herdr-app-linux-aarch64.tar.gz"
)
sha256sums_x86_64=('475a383f8f439e3191a86635b5c1286ce4dfd2d9fcdf1e7cbdfdd6c7176f8ff3')
sha256sums_aarch64=('30a431ce95c17356efe8afed50c4eaf8888d83ef45acd9aa911094d51707d007')

package() {
    install -Dm755 "$srcdir/herdr-app/herdr-app" "$pkgdir/usr/bin/herdr-app"
    install -Dm644 "$srcdir/herdr-app/herdr-app.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/herdr-app.svg"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/herdr-app.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Herdr
Comment=Terminals and coding agents that keep running
Exec=herdr-app
Icon=herdr-app
Terminal=false
Categories=Development;
StartupWMClass=herdr-app
DESKTOP

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        "$srcdir/herdr-app/LICENSE" "$srcdir/herdr-app/THIRD-PARTY-NOTICES"
}
