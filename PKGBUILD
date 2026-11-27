# Maintainer: toxdes <hi@toxdes.com>
pkgname=quectop-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Linux resource monitor"
arch=('x86_64' 'aarch64')
url='https://github.com/toxdes/quectop'
license=('MIT')
provides=("quectop=${pkgver}")
conflicts=('quectop')
makedepends=('git')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/quectop"
  printf '%s.r%s.g%s\n' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/quectop"
  make quectop
}

package() {
  cd "$srcdir/quectop"
  install -Dm755 quectop "$pkgdir/usr/bin/quectop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
