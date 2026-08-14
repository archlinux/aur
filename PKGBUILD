# Maintainer: Mopigames <mopigames@proton.me>

pkgname=vanilla-wiiu-git
_pkgname=vanilla
pkgver=r486.g066aefd
pkgrel=1
pkgdesc="A work-in-progress Wii U GamePad software clone for Linux"
arch=('x86_64')
url="https://github.com/vanilla-wiiu/vanilla"
license=('GPL-2.0-only')
depends=(
  'ffmpeg'
  'glib2'
  'glibc'
  'libdrm'
  'libgcc'
  'libglvnd'
  'libnl'
  'libnm'
  'libva'
  'libx11'
  'libxml2'
  'openssl'
  'polkit'
  'sdl2'
  'sdl2_image'
  'sdl2_ttf'
)
makedepends=('cmake' 'git' 'pkgconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVANILLA_BUILD_VENDORED=OFF \
    -DVANILLA_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
