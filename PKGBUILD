# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mupen64plus-video-parallel-highscore-git
pkgver=r67.9197cd8
pkgrel=1
pkgdesc="ParaLLEl-RDP with mupen64plus-highscore modifications"
arch=('x86_64')
url="https://github.com/highscore-emu/parallel-rdp"
license=('MIT')
depends=('mupen64plus-git')
makedepends=(
  'git'
  'meson'
  'vulkan-headers'
)
provides=("${pkgname%-git}" 'mupen64plus-video-parallel')
conflicts=("${pkgname%-git}" 'mupen64plus-video-parallel')
source=('git+https://github.com/highscore-emu/parallel-rdp.git')
sha256sums=('SKIP')

pkgver() {
  cd parallel-rdp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson parallel-rdp build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
