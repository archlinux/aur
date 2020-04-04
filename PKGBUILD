# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-gtkgreet-git
pkgver=r64.210cf519b9
pkgrel=1
pkgdesc="GTK based greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/gtkgreet"
license=(GPL3)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd-gtkgreet)
provides=(greetd-gtkgreet)
makedepends=(git meson ninja scdoc)
depends=(gtk3 gtk-layer-shell)

pkgver() {
  cd gtkgreet
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

build() {
  mkdir -p build
  arch-meson gtkgreet build -D layershell=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
