# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-gtkgreet-git
pkgver=0.7
pkgrel=1
pkgdesc="GTK based greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/gtkgreet"
license=(GPL3)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd-gtkgreet)
provides=(greetd-gtkgreet=${pkgver%+*})
makedepends=(git meson ninja scdoc)
depends=(gtk3 gtk-layer-shell json-c)

pkgver() {
  git -C gtkgreet describe --abbrev=10 | sed 's/-/+/; s/-/./'
}

build() {
  mkdir -p build
  arch-meson gtkgreet build -D layershell=enabled
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
