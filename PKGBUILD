pkgname=macaw-movies-git
_pkgname=macaw-movies
pkgver=v0.1.1
pkgrel=1
pkgdesc='An open movie organizer (alpha version)'
arch=(i686 x86_64)
url='https://macawmovies.wordpress.com'
license=(GPL)
depends=(qt5-base sqlite)
makedepends=(git cmake)
provides=(macaw-movies)
source=("git+https://github.com/macaw-movies/macaw-movies.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  mkdir -p $_pkgname/build
}

build() {
  cd $_pkgname/build
  cmake -DCMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  cd $_pkgname/build/
  install -Dm755 "macaw-movies" "${pkgdir}/usr/bin/macaw-movies"
  install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/macaw-movies/COPYING"
}
