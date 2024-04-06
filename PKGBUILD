# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=blastem-highscore-git
pkgver=r2446.40a8b22
pkgrel=1
pkgdesc="Highscore port of BlastEm"
arch=('x86_64')
url="https://github.com/alice-mkh/blastem-highscore"
license=('GPL-3.0-or-later')
depends=('libhighscore-git')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alice-mkh/blastem-highscore.git')
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
