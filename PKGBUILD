# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=mrsh-git
pkgver=r342.7f363b2
pkgrel=2
pkgdesc='A minimal POSIX shell'
url='https://git.sr.ht/~emersion/mrsh'
license=('custom: MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('git' 'meson')
provides=('mrsh')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

check() {
  ninja -C "$srcdir/build" test
}

package() {
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
  install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" \
    "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}
