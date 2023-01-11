# Maintainer: yoshino <yoshino@git.yumil.in>

pkgname=xr-video-player-git
pkgver=r88.2e7d96d
pkgrel=1
pkgdesc='A virtual reality video player for Linux. Fork of vr-video-player by dec05eba'
arch=('x86_64')
url="https://codeberg.org/yoshino/xr-video-player"
license=('GPL3')
depends=(
  'glm'
  'glew'
  'glib2'
  'sdl2'
  'openxr'
  'wayland'
  'pipewire'
  'mpv'
)
makedepends=(
  'git'
  'cmake'
)
provides=('xr-video-player')
conflicts=('xr-video-player')
source=("$pkgname::git+https://codeberg.org/yoshino/xr-video-player")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/xr-video-player/LICENSE"
}
