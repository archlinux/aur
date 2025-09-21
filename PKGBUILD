
# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgname=wayfire-plugin-filters-git
pkgver=r37.00024b5
pkgrel=1
pkgdesc="3D wayland compositor filters plugin"
arch=('x86_64')
url="https://github.com/soreau/filters"
license=('MIT')
depends=('wayfire-git' 'glibmm' 'wayland-protocols' 'glm')
makedepends=('git' 'meson' 'ninja' 'libdisplay-info' 'yyjson' 'boost' 'vulkan-headers')
optdepends=('wcm: GTK3-based configuration tool for the Wayfire compositor')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/soreau/filters')
sha256sums=('SKIP')
pkgver() {
        cd "$srcdir/filters"

# Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
  rm -rf build
  arch-meson filters build
}


build() {
  ninja -C build
}


package() {
        DESTDIR="$pkgdir/" ninja -C build install
}
