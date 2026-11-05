# Maintainer: Qingxu <me@linioi.com>
pkgname=herdr-app-bin
pkgver=0.1.13
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
sha256sums_x86_64=('77b0be72a46ca14bb367365a04164641f914b3a69712bac391d39c56a959bef4')
sha256sums_aarch64=('2e5bb05c47cffbad018ad34217ea4c816476d7eb842692f740798c9020f0281e')

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
