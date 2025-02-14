# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nestopia-highscore-git
pkgver=1.52.0.r193.g6c8c001
pkgrel=1
pkgdesc="Highscore port of Nestopia JG"
arch=('x86_64')
url="https://gitlab.com/alice-m/nestopia"
license=('GPL-2.0-or-later')
depends=('libhighscore-git')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/alice-m/nestopia.git')
sha256sums=('SKIP')

pkgver() {
  cd nestopia
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
