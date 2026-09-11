# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-git
pkgver=3.0.0
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()
makedepends=('git' 'go')
source=('git+https://github.com/toxdes/vylk.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/vylk"
  git describe --long --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/vylk"
  go build -trimpath -ldflags "-s -w -X main.version=${pkgver}" -o vylk .
}

package() {
  cd "$srcdir/vylk"
  install -Dm755 vylk "$pkgdir/usr/bin/vylk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
