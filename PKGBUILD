pkgname=linver-git
pkgver=r2.121d877
pkgrel=1
pkgdesc="winver, but for Linux (VCS master branch)"
arch=('x86_64')
url="https://github.com/itsflameee/linver"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('git' 'cmake' 'ninja')
provides=('linver')
conflicts=('linver' 'linver-bin')
source=("linver::git+ssh://git@github.com/itsflameee/linver.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/linver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$srcdir/linver" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
