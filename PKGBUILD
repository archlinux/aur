# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=xdgctl-git
pkgdesc='TUI for managing XDG default applications'
pkgver=r19.9797f48
pkgrel=1
url=https://github.com/mitjafelicijan/xdgctl
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/heads/master"
license=(BSD-2-Clause)
depends=(glib2)
makedepends=(git gcc)
arch=(x86_64)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(
  "$pkgname::git+$url.git"
  "$_rawurl/LICENSE"
)
sha256sums=('SKIP'
            '9e3828f9fe592193e8790c2a299b51c52b1c8a1aa076f9fc0d59563e7318b589')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  gcc $CFLAGS $(pkg-config --cflags gio-2.0 gio-unix-2.0) -o xdgctl main.c $(pkg-config --libs gio-2.0 gio-unix-2.0) $LDFLAGS
}

package() {
  cd "$pkgname"
  install -Dm755 xdgctl "$pkgdir/usr/bin/xdgctl"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
