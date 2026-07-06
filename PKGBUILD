
# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgname=wayfire-plugin-gtk4-decorator-git
pkgver=r38.b8a9b62
pkgrel=1
pkgdesc="3D wayland compositor GTK4 decorator plugin"
arch=('x86_64')
url="https://github.com/soreau/wf-csd-deco"
license=('MIT')
depends=('wayfire-git' 'gtk4')
makedepends=('git' 'meson' 'ninja' 'vulkan-headers')
optdepends=('wcm: GTK3-based configuration tool for the Wayfire compositor')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/soreau/wf-csd-deco#branch=groups-n-tabs')
sha256sums=('SKIP')
pkgver() {
        cd "$srcdir/wf-csd-deco"

# Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  arch-meson wf-csd-deco build
}


build() {
  ninja -C build
}


package() {
        DESTDIR="$pkgdir/" ninja -C build install
        install -Dm644 "$srcdir/wf-csd-deco/LICENSE" \
                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
