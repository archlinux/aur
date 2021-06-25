# Maintainer: Deian Stefan

_pkgname=btor2tools
pkgname=btor2tools-git
pkgver=r79.6ba194b
pkgrel=1
pkgdesc="A generic parser and tool package for the BTOR2 format."
arch=('x86_64')
url="https://github.com/Boolector/btor2tools"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("$_pkgname")
source=("git://github.com/Boolector/btor2tools.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_INSTALL_PREFIX='/usr'

  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_pkgname/LICENSE.txt"
}
