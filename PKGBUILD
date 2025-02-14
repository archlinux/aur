# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=stella-highscore-git
pkgver=r8080.dbb3300
pkgrel=1
pkgdesc="Highscore port of Stella"
arch=('x86_64')
url="https://github.com/alice-mkh/stella"
license=('GPL-2.0-or-later')
depends=('libhighscore-git')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alice-mkh/stella.git')
sha256sums=('SKIP')

pkgver() {
  cd stella
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd stella/src/os
  arch-meson highscore build
  meson compile -C build
}

check() {
  cd stella/src/os
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  cd stella/src/os
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
