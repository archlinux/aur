# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vr-video-player-git
pkgver=r9.15c0408
pkgrel=1
pkgdesc='A virtual reality video player for x11 on Linux'
arch=('x86_64')
url="https://github.com/DEC05EBA/vr_video_player"
license=('custom:BSD3')
depends=('glm' 'glew' 'sdl2' 'libglvnd' 'openvr' 'libx11' 'libxcomposite' 'mpv')
makedepends=('sibs')
provides=('vr-video-player')
conflicts=('vr-video-player')
source=("git+https://github.com/DEC05EBA/vr_video_player.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/vr_video_player"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/vr_video_player"
  sibs build --release
}

package() {
  cd "$srcdir/vr_video_player"
  install -D -m +x "sibs-build/$(sibs platform)/release/vr_video_player" "$pkgdir/usr/bin/vr-video-player"
  install -Dm644 config/hellovr_actions.json "$pkgdir/usr/share/vr-video-player/hellovr_actions.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vr-video-player/LICENSE"
}
