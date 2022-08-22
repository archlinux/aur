# Maintainer: Mark Wagie <mark dot wagie>
# Contributor: Batuhan Baserdem <lastn.firstn[at]gmail>
pkgname=material-cursors-git
pkgver=20220817.r43.2a5f302
pkgrel=1
pkgdesc="Material cursors with 3 color variants"
arch=('any')
url="https://www.pling.com/p/1346778"
license=('GPL2')
makedepends=('git' 'inkscape' 'libcanberra' 'xorg-xcursorgen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/varlesh/material-cursors.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(git show -s --format=%cd --date=format:%Y%m%d HEAD)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  make clean
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export NO_AT_BRIDGE=1
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}
