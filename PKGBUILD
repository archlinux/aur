# Maintainer: Jakub Skowron <jakubskowron676@gmail.com>
pkgname=scolorpicker
pkgver=2.1.1
pkgrel=1
epoch=
pkgdesc="smooll's Color Picker"
arch=("x86_64")
url="https://www.github.com/smooll-d/scolorpicker"
license=("0BSD")
groups=()
depends=("sdl3" "sdl3_image")
makedepends=("cmake")
checkdepends=()
optdepends=("libx11: X11 support"
            "wayland: Wayland support"
            "wayland-protocols: Wayland support"
            "sdbus-cpp: taking screenshots on Wayland"
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
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DSCP_BUILD_DOCUMENTATION=ON \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
    cmake --build build --target dist
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname-$pkgver/LICENSE
}
