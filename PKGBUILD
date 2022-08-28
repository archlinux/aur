# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nanopolish
pkgver=0.14.0
pkgrel=1
pkgdesc="Provide signal-level analysis of Oxford Nanopore sequencing data"
arch=('i686' 'x86_64')
url="https://github.com/jts/nanopolish"
license=('MIT')
depends=('glibc' 'hdf5' 'htslib' 'zlib')
makedepends=('git' 'eigen' 'wget')
source=("git+https://github.com/jts/nanopolish.git#tag=v$pkgver")
sha256sums=('SKIP')


prepare() {
  cd "nanopolish"

  git submodule update --init --recursive --remote
}

build() {
  cd "nanopolish"

  make \
    EIGEN=noinstall \
    HDF5=noinstall \
    HTS=noinstall \
    EIGEN_INCLUDE="-I/usr/include/eigen3" \
    H5_INCLUDE="-I/usr/include" \
    HTS_INCLUDE="-I/usr/include/htslib"
}

check() {
  cd "nanopolish"

  make \
    EIGEN=noinstall \
    HDF5=noinstall \
    HTS=noinstall \
    EIGEN_INCLUDE="-I/usr/include/eigen3" \
    H5_INCLUDE="-I/usr/include" \
    HTS_INCLUDE="-I/usr/include/htslib" \
    test
}

package() {
  cd "nanopolish"

  install -Dm755 "nanopolish" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/nanopolish"
}
