# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-gtkgreet-git
pkgver=r46.86f628c6fd
pkgrel=1
pkgdesc="GTK based greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/gtkgreet"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd-gtkgreet)
provides=(greetd-gtkgreet)
makedepends=(meson ninja gtk-layer-shell)

pkgver() {
  cd gtkgreet
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

prepare() {
  [ -d build ] ||
  meson gtkgreet build \
    -D layershell=true
}

build() {
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 build/gtkgreet/gtkgreet "$pkgdir"/usr/bin/
}
