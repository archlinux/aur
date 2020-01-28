# Maintainer: blallo <blallo@autistici.org>

pkgname=doh-curl-git
pkgrel=1
pkgver=doh.0.1.r16.gacc9ab5
pkgdesc='stand-alone application for DoH (DNS-over-HTTPS) name resolves and lookups'
arch=(any)
url=https://github.com/curl/doh
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'make' 'gcc')
source=("git://github.com/curl/doh.git")
sha256sums=('SKIP')
provides=('doh')
pkgver() {
  cd "$srcdir/doh"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/doh"
  make
}

package() {
  local BINDIR=/usr/bin
  local MANDIR=/usr/share/man
  cd "$srcdir/doh"
  install -d "$pkgdir$BINDIR"
  install -m 0755 doh "$pkgdir$BINDIR"
  install -d "$pkgdir$MANDIR/man1/"
  install -m 0744 doh.1 "$pkgdir$MANDIR/man1/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/doh/LICENSE"
}

# vim:set ts=2 sw=2 et:
