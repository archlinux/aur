# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

_name=diskgraph
pkgname="${_name}-git"
pkgver=r39.f024e33
pkgrel=1
pkgdesc="Graphs the disk IO in a Linux terminal."
arch=('x86_64')
url="https://github.com/stolk/${_name}"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("$pkgname::git+$url#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dvm 755 diskgraph -t "$pkgdir/usr/bin/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

