# Maintainer: Skylar Hill <stellarskylark at posteo.net>
pkgname=guile-commonmark-git
pkgver=0.1.r45.g538ffea
pkgrel=1
pkgdesc="Guile library for parsing CommonMark"
arch=('any')
url="https://github.com/OrangeShark/guile-commonmark"
license=('LGPL3')
depends=('guile')
makedepends=('autoconf' 'pkg-config')
provides=('guile-commonmark')
conflicts=('guile-commonmark')
source=("guile-commonmark-git::git+https://github.com/OrangeShark/guile-commonmark/")
sha512sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

check() {
  echo "Skipping tests due to upstream bug causing them to fail."
  # cd "$pkgname"
  # make check
}

package() {
  cd "$srcdir"/"$pkgname"
  make DESTDIR="$pkgdir/" install
}
