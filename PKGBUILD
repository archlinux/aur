# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gearsystem-highscore-git
pkgver=r1291.ae7bebc
pkgrel=1
pkgdesc="Highscore port of Gearsystem"
arch=('x86_64')
url="https://github.com/highscore-emu/Gearsystem"
license=('GPL-3.0-or-later')
depends=('libhighscore-git')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/Gearsystem.git')
sha256sums=('SKIP')

pkgver() {
  cd Gearsystem
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd Gearsystem/platforms
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd Gearsystem/platforms
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
