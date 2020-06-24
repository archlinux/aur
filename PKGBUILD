# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vr-video-player-git
pkgver=r35.c3e9670
pkgrel=4
pkgdesc='A virtual reality video player for x11 on Linux'
arch=('x86_64')
url="https://git.dec05eba.com/vr-video-player"
license=('custom:BSD3')
makedepends=('git')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite')
makedepends=('sibs')
provides=('vr-video-player')
conflicts=('vr-video-player')
source=("git+https://git.dec05eba.com/vr-video-player")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/vr-video-player"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/vr-video-player"
  sibs build --release
}

package() {
  cd "$srcdir/vr-video-player"
  install -Dm755 "sibs-build/$(sibs platform)/release/vr-video-player" "$pkgdir/usr/bin/vr-video-player"
  install -Dm644 config/hellovr_actions.json "$pkgdir/usr/share/vr-video-player/hellovr_actions.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vr-video-player/LICENSE"
}
