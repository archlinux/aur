# Maintainer: Lumyxen
pkgname=wayland-app-launcher-git
pkgver=1.0.0.r2.gd392cb3
pkgrel=1
pkgdesc='Small Wayland application launcher rendered with Vulkan'
arch=('x86_64')
url='https://github.com/Lumyxen/WAL'
license=('Apache-2.0')
provides=('wayland-app-launcher')
conflicts=('wayland-app-launcher')
depends=(
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'librsvg'
  'libxkbcommon'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=(
  'cmake'
  'git'
  'glslang'
  'pkgconf'
  'vulkan-headers'
)
optdepends=(
  'wl-clipboard: clipboard shortcuts'
)
source=('WAL::git+https://github.com/Lumyxen/WAL.git')
b2sums=('SKIP')

pkgver() {
  cd WAL
  git describe --tags --long --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake -S "$srcdir/WAL" -B "$srcdir/build" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -Wno-dev
  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  install -Dm644 "$srcdir/WAL/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
