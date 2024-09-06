# Maintainer: Librewish <librewish@gmail.com>

pkgname=wayfire-plugins-extra-track-wlroots-0.18-git
pkgver=r262.df42bc7
pkgrel=1
pkgdesc="3D wayland compositor extra plugins, tracking wlroots 0.18 branch of Wayfire"
arch=('any')
url="https://github.com/WayfireWM/wayfire-plugins-extra"
license=('MIT')
depends=('wayfire-hidpi-xprop-track-wlroots-git' 'glibmm' 'iio-sensor-proxy' 'wayland-protocols' 'glm' 'librsvg')
makedepends=('git' 'meson' 'ninja' 'libdisplay-info' 'nlohmann-json' 'glm')
optdepends=('wcm: GTK3-based configuration tool for the Wayfire compositor')
provides=("${pkgname}" "wayfire-plugins-extra")
conflicts=("wayfire-plugins-extra")
replaces=()
options=()
source=('git+https://github.com/WayfireWM/wayfire-plugins-extra#branch=track-wlroots-0.18')
sha256sums=('SKIP')
install=wayfire-plugins-extra.install
prepare() {
  cd "$srcdir/wayfire-plugins-extra"
  git submodule update --init --recursive
}
pkgver() {
        cd "$srcdir/wayfire-plugins-extra"

# Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  arch-meson wayfire-plugins-extra build \
    -Denable_windecor=true \
    -Denable_wayfire_shadows=true \
    -Denable_focus_request=true \
    -Denable_pixdecor=true \
    -Denable_filters=true
  ninja -C build
}


package() {
        DESTDIR="$pkgdir/" ninja -C build install
}
