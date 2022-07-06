# Maintainer: madprops <mprops at protonmail dot com>

pkgname="copyevent-git"
pkgdesc="Polling-free clipboard notifier. Like clipnotify but with a selection flag"
pkgver=r3.52a7199
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/copyevent"
license=("Unlicense")
depends=("libx11" "libxfixes")
makedepends=("git" "gcc")
sha256sums=("SKIP")
source=("$pkgname::git+$url.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd copyevent-git
  gcc copyevent.c -o copyevent -I/usr/X11R6/include -L/usr/X11R6/lib -lX11 -lXfixes
}

package() {
  cd copyevent-git
  install -D -m755 copyevent "$pkgdir/usr/bin/copyevent"
}
