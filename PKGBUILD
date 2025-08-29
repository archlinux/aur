# Maintainer: fekoneko <https://github.com/fekoneko>

pkgname='piximan'
pkgver=0.11.2
pkgrel=2
pkgdesc='Pixiv batch downloader and local collection viewer'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/fekoneko/piximan'
license=('GPL-3.0-only')
makedepends=('go')

_srcname="$pkgname-$pkgver.tar.gz"
_srcurl="https://github.com/fekoneko/piximan/archive/refs/tags/v$pkgver.tar.gz"
source=("$_srcname::$_srcurl")
sha256sums=('e9d1ba1b426f0195199815f0496bdfee80278a972d43ea77b1d3008348cf12ca')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  make build:current PIXIMAN_VERSION="v$pkgver"
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  platform="$(go env GOOS)_$(go env GOARCH)"
  install -Dm755 "bin/$platform/piximan" "$pkgdir/usr/bin/piximan"
  install -Dm644 'COPYING' "$pkgdir/usr/share/licenses/piximan/COPYING"
}
