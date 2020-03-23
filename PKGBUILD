# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_srcname=musly
pkgname=musly-git
pkgdesc="Music Similarity Library"
pkgver=0.1.110.g7a0c6a9
pkgrel=1
arch=('x86_64')
url="https://www.musly.org"
license=('custom:MPL2.0')
provides=('musly')
makedepends=('cmake')
depends=('ffmpeg' 'eigen')
source=(
  "${_srcname}::git+https://github.com/dominikschnitzer/musly.git#branch=master"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/${_srcname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/${_srcname}"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/${_srcname}/build"
  make DESTDIR="$pkgdir" install
}
