# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libosmscout-git
pkgver=r8147.1091ff4
pkgrel=1
arch=(x86_64)
url='https://github.com/Framstag/libosmscout'
license=(LGPL3 custom)
pkgdesc='A C++ library for offline map rendering, routing and location lookup based on OpenStreetMap data'
depends=(qt6-base qt6-multimedia qt6-declarative qt6-svg glu)
makedepends=(git meson ninja)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/Framstag/libosmscout")
sha256sums+=('SKIP')

pkgver() {
  cd libosmscout
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  meson setup --prefix /usr -DqtVersion=6 build libosmscout
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 libosmscout/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}
