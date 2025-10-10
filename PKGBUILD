# Maintainer: Jakub Skowron <jakubskowron676@gmail.com>
pkgname=scolorpicker
pkgver=2.5.0
pkgrel=1
epoch=
pkgdesc="smooll's Color Picker"
arch=("x86_64")
url="https://www.github.com/smooll-d/scolorpicker"
license=("0BSD")
groups=()
depends=("sdl3")
makedepends=("cmake" "base-devel")
checkdepends=()
optdepends=("libx11: X11 support"
            "libxcb: X11 support"
            "xcb-util-image: taking screenshots on X11"
            "wayland: Wayland support"
            "wayland-protocols: Wayland support"
            "sdbus-cpp: handling screenshots on Wayland"
            "xdg-desktop-portal: taking screenshots on Wayland"
            "xdg-desktop-portal-cosmic: taking screenshots on COSMIC"
            "xdg-desktop-portal-dde: taking screenshots on Deepin"
            "xdg-desktop-portal-gnome: taking screenshots on GNOME"
            "xdg-desktop-portal-hyprland: taking screenshots on Hyprland"
            "xdg-desktop-portal-kde: taking screenshots on KDE Plasma"
            "xdg-desktop-portal-wlr: taking screenshots on wlroots-based compositors"
            "xdg-desktop-portal-xapp: taking screenshots on Cinnamon")
provides=()
conflicts=("scolorpicker-legacy")
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=("https://github.com/smooll-d/scolorpicker/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("de98104508365454013d632e220b437452e418a3e532f864d1b94ceed0500924")
validpgpkeys=()

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DSCP_BUILD_DOCUMENTATION=ON \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
    cmake --build build --target dist
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname-$pkgver/LICENSE
}
