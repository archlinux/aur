# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Batuhan Baserdem <lastn.firstn[at]gmail>
pkgname=material-cursors-git
pkgver=20220817.r43.2a5f302
pkgrel=1
pkgdesc="Material cursors with 3 color variants"
arch=('any')
url="https://github.com/varlesh/material-cursors"
license=('GPL-2.0-or-later')
makedepends=('git' 'inkscape' 'libcanberra' 'xorg-xcursorgen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/varlesh/material-cursors.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(git show -s --format=%cd --date=format:%Y%m%d HEAD)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  make clean
}

build() {
  cd "${pkgname%-git}"
  export NO_AT_BRIDGE=1
  make build
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}
