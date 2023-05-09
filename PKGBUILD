pkgname=btllib
pkgver=1.6.0
pkgrel=0
pkgdesc="Bioinformatics Technology Lab common code library https://doi.org/10.21105/joss.04720"
arch=(any)
url="https://github.com/bcgsc/btllib"
license=(GPL3)
depends=('gcc-libs' 'samtools' 'python')
makedepends=('meson' 'ninja' 'cmake' 'git' 'doxygen' 'swig')
source=("git+$url.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname
  git submodule update --init --recursive
}

build() {
  cd $srcdir/$pkgname
#CXXFLAGS="${CXXFLAGS} -std=c++14"
  arch-meson build \
  --buildtype      release
  ninja -C build
}

package() {
  cd $srcdir/$pkgname
  DESTDIR="${pkgdir}" ninja -C build install
}
