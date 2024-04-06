# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bsnes-highscore-git
pkgver=r3019.1ae043e3
pkgrel=1
pkgdesc="Highscore port of BSNES"
arch=('x86_64')
url="https://github.com/alice-mkh/bsnes"
license=('GPL-3.0-or-later')
depends=('libhighscore-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alice-mkh/bsnes.git')
sha256sums=('SKIP')

pkgver() {
  cd bsnes
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd bsnes
  make -C bsnes \
    target=highscore \
    binary=library \
    build=performance \
    local=false \
    platform=linux
}

package() {
  cd bsnes
  install -Dm755 "bsnes/out/${pkgname%-git}.so" -t \
    "$pkgdir/usr/lib/highscore/cores/"
  install -m644 bsnes/target-highscore/bsnes.highscore -t \
    "$pkgdir/usr/lib/highscore/cores/"
}
