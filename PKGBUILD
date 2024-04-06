# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mednafen-highscore-git
pkgver=r19.af13095
pkgrel=1
pkgdesc="Highscore port of Mednafen"
arch=('x86_64')
url="https://github.com/alice-mkh/mednafen-highscore"
license=('GPL-2.0-or-later')
depends=('libhighscore-git' 'zstd')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alice-mkh/mednafen-highscore.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd "${pkgname%-git}"
  meson install -C build --destdir "$pkgdir"
}
