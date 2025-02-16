# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mupen64plus-video-parallel-highscore-git
pkgver=r66.a6cd5b4
pkgrel=1
pkgdesc="Parallel RDP plugin for Highscore port of Mupen64Plus"
arch=('x86_64')
url="https://github.com/alice-mkh/parallel-rdp"
license=('MIT')
depends=('mupen64plus-git')
makedepends=(
  'git'
  'meson'
  'vulkan-headers'
)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}" 'mupen64plus-video-parallel')
conflicts=("${pkgname%-git}" 'mupen64plus-video-parallel')
source=('git+https://github.com/alice-mkh/parallel-rdp.git')
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
