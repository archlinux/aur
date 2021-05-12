# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=diskgraph-git
pkgver=r23.a832afd
pkgrel=1
pkgdesc="Monitor for disk IO"
arch=('x86_64')
url="https://github.com/stolk/diskgraph"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
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
