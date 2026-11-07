# Maintainer: smiley <smiley@archlinux.org>

pkgname=hyprlogin
pkgver=0.4.0
pkgrel=1
pkgdesc='GPU-accelerated greetd greeter for Hyprland, forked from hyprlock'
arch=('x86_64')
url='https://github.com/AuthenticSm1les/hyprlogin'
license=('BSD-3-Clause')
depends=(
  'cairo'
  'glibc'
  'hyprgraphics'
  'hyprlang'
  'hyprutils'
  'libegl'
  'libgcc'
  'libgles'
  'libstdc++'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'cmake'
  'hyprwayland-scanner'
  'libdrm'
  'pango'
  'pkgconf'
  'wayland-protocols'
)
optdepends=(
  'greetd: login manager integration'
  'hyprland: greeter compositor session'
)
backup=('etc/hyprlogin/hyprlogin.conf')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e05e6238c674a75f08ead7867f0c47d397cffe66a82f91d3cfcb77558df14a1e')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DHYPRLOGIN_COMMIT="v$pkgver" \
    -DHYPRLOGIN_VERSION_COMMIT="v$pkgver"
  cmake --build build --target hyprlogin
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$pkgname-$pkgver/assets/example.conf" "$pkgdir/etc/hyprlogin/hyprlogin.conf"
}
