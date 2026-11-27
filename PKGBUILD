# Maintainer: toxdes <hi@toxdes.com>
pkgname=quectop-hub-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Dashboard and data collector for quectop probes"
arch=('x86_64' 'aarch64')
url='https://github.com/toxdes/quectop'
license=('MIT')
depends=('quectop')
provides=("quectop-hub=${pkgver}")
conflicts=('quectop-hub')
makedepends=('git' 'bun' 'python')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/quectop"
  printf '%s.r%s.g%s\n' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/quectop"
  make quectop-hub
}

package() {
  cd "$srcdir/quectop"
  install -Dm755 quectop-hub "$pkgdir/usr/bin/quectop-hub"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 web/icons/LICENSE "$pkgdir/usr/share/licenses/$pkgname/tabler-icons.LICENSE"
}
