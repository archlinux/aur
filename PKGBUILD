# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nestopia-highscore-git
pkgver=r439.357f6bf
pkgrel=1
pkgdesc="Highscore port of Nestopia-JG"
arch=('x86_64')
url="https://gitlab.com/highscore-emu/nestopia"
license=('GPL-2.0-or-later')
depends=('libhighscore-git')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/highscore-emu/nestopia.git')
sha256sums=('SKIP')

pkgver() {
  cd nestopia
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd nestopia
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd nestopia
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
