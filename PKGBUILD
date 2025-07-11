# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mednafen-highscore-git
pkgver=1.32.1.r44.g9f2aa99
pkgrel=1
pkgdesc="Highscore port of Mednafen"
arch=('x86_64')
url="https://github.com/highscore-emu/mednafen-highscore"
license=('GPL-2.0-or-later')
depends=(
  'libhighscore-git'
  'zstd'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/mednafen-highscore.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd "${pkgname%-git}"
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
