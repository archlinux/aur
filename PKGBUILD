#Maintainer: Jean Schoeller jean@schoeller.fr
pkgname="iio-hyprland-git"
_pkgname="iio-hyprland"
pkgbase="iio-hyprland-git"
pkgver=r67.bd6be6b
pkgrel=1
pkgdesc="Reads iio-proxy-sensor output to enable automatic touchscreen rotation in Hyprland"
arch=("x86_64")
depends=("iio-sensor-proxy")
makedepends=("meson" "git")
licence=" GPL-3.0-or-later"
url="https://github.com/JeanSchoeller/iio-hyprland.git"

source=("iio-hyprland::git+https://github.com/JeanSchoeller/iio-hyprland.git")
sha1sums=(
SKIP
)

pkgver() {
cd "$_pkgname"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
arch-meson "$_pkgname" build
meson compile -C build
}

package() {
meson install -C build --destdir "$pkgdir"
}

