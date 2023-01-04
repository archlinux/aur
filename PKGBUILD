# Maintainer: Martin <martin.marmsoler@gmail.com>

pkgname=vector_blf-git
pkgver=r480.g02f0a2f
pkgrel=1
pkgdesc="This is a library to access Binary Log File (BLF) files from Vector Informatik."
arch=('i686' 'x86_64')
url="https://github.com/Technica-Engineering/vector_blf"
license=('custom')
depends=()
makedepends=('git' 'cmake')
provides=('vector_blf')
conflicts=('vector_blf')
options=('staticlibs')
source=("git+https://github.com/Technica-Engineering/vector_blf.git")
sha256sums=('SKIP')


pkgver() {
  cd "vector_blf"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "vector_blf"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DOPTION_RUN_DOXYGEN=OFF \
    ./
  make -C "_build"
}

package() {
  cd "vector_blf"

  make -C "_build" DESTDIR="$pkgdir" install
  #install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/vector_blf"
}
