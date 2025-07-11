# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=prosystem-highscore-git
pkgver=r143.77a6764
pkgrel=1
pkgdesc="Highscore port of ProSystem-JG"
arch=('x86_64')
url="https://gitlab.com/highscore-emu/prosystem"
license=('GPL-2.0-or-later')
depends=('libhighscore-git')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/highscore-emu/prosystem.git')
sha256sums=('SKIP')

pkgver() {
  cd prosystem
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd prosystem
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd prosystem
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
