
# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgname=wayfire-plugin-pixdecor-git
pkgver=r167.1bf8953
pkgrel=1
pkgdesc="3D wayland compositor pixdecor plugin"
arch=('x86_64')
url="https://github.com/soreau/pixdecor"
license=('MIT')
depends=('wayfire-git' 'glm')
makedepends=('git' 'meson' 'ninja' 'cmake' 'vulkan-headers')
optdepends=('wcm: GTK3-based configuration tool for the Wayfire compositor')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/soreau/pixdecor')
sha256sums=('SKIP')
pkgver() {
        cd "$srcdir/pixdecor"

# Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  arch-meson pixdecor build
}


build() {
  ninja -C build
}


package() {
        DESTDIR="$pkgdir/" ninja -C build install
        install -Dm644 "$srcdir/pixdecor/LICENSE" \
                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
