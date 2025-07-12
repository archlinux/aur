# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=genesis-plus-gx-highscore-git
pkgver=r1711.e36edee
pkgrel=1
pkgdesc="Highscore port of Genesis Plus GX"
arch=('x86_64')
url="https://github.com/highscore-emu/Genesis-Plus-GX"
license=('LicenseRef-custom')
depends=(
  'flac'
  'libhighscore-git'
  'libvorbis'
  'zlib'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/Genesis-Plus-GX.git')
sha256sums=('SKIP')

pkgver() {
  cd Genesis-Plus-GX
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd Genesis-Plus-GX
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd Genesis-Plus-GX
  meson install -C build --no-rebuild --destdir "$pkgdir"

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
