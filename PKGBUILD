# Maintainer: fekoneko <https://github.com/fekoneko>

pkgname='piximan'
pkgver=0.11.3
pkgrel=1
pkgdesc='Pixiv batch downloader and local collection viewer'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/fekoneko/piximan'
license=('GPL-3.0-only')
makedepends=('go')

_srcname="$pkgname-$pkgver.tar.gz"
_srcurl="https://github.com/fekoneko/piximan/archive/refs/tags/v$pkgver.tar.gz"
source=("$_srcname::$_srcurl")
sha256sums=('786c5931c420f010cda27a393b9a50cfdcf69a689f031fa6899e46da075d89b8')

build() {
  cd "piximan-$pkgver"
  export GOPATH="$srcdir"
  make build:current PIXIMAN_VERSION="v$pkgver"
  go clean -modcache
}

package() {
  cd "piximan-$pkgver"
  platform="$(go env GOOS)_$(go env GOARCH)"
  install -Dm755 "bin/$platform/piximan" "$pkgdir/usr/bin/piximan"
  install -Dm644 'COPYING' "$pkgdir/usr/share/licenses/piximan/COPYING"
}
