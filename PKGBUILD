# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=sameboy-highscore-git
pkgver=r2664.06dafde
pkgrel=1
pkgdesc="Highscore port of SameBoy"
arch=('x86_64')
url="https://github.com/highscore-emu/SameBoy"
license=('Expat')
depends=(
  'libhighscore-git'
  'rgbds'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/SameBoy.git')
sha256sums=('SKIP')

pkgver() {
  cd SameBoy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd SameBoy
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd SameBoy
  meson install -C build --no-rebuild --destdir "$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
