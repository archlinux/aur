# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=wl-gears-git
pkgver=r7.b7ecdeb
pkgrel=4
pkgdesc="Gears for Wayland compositors"
arch=(x86_64)
url="https://git.sr.ht/~soreau/${pkgname%-git}"
license=(MIT)
depends=(
  glibc
  libepoxy
  libglvnd
  wayland
)
makedepends=(
  git
  wayland-protocols
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  sed -n 's/ \* //g;2,20p' gears.c > LICENSE
}

build() {
  cd ${pkgname%-git}
  make
}

package() {
  cd ${pkgname%-git}
  install -vDm755 ${pkgname%-git} -t "$pkgdir"/usr/bin/
  install -vDm644 LICENSE         -t "$pkgdir"/usr/share/licenses/$pkgname/
}
