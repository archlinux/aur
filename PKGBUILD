# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mupen64plus-highscore-git
pkgver=r85.fcdc05b
pkgrel=1
pkgdesc="Highscore port of Mupen64Plus"
arch=('x86_64')
url="https://github.com/alice-mkh/mupen64plus-highscore"
license=('GPL-2.0-only')
depends=(
  'libhighscore-git'
  'mupen64plus-rsp-parallel-highscore-git'
  'mupen64plus-video-gliden64-highscore-git'
  'mupen64plus-video-parallel-highscore-git'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alice-mkh/mupen64plus-highscore.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
