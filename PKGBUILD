# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=oidn
pkgver=1.1.0
_fragment="#tag=v${pkgver}"
pkgrel=1
pkgdesc="Intel(R) Open Image Denoise library"
arch=('x86_64')
url="http://www.openimagedenoise.org/"
license=('Apache')
depends=(intel-tbb python)
makedepends=(git cmake)
source=("${pkgname}::git+https://github.com/OpenImageDenoise/oidn.git${_fragment}"
        "git+https://github.com/OpenImageDenoise/mkl-dnn.git"
        "git+https://github.com/OpenImageDenoise/oidn-weights.git"
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd ${srcdir}/${pkgname}
  git config submodule.mkl-dnn.url ${srcdir}/mkl-dnn
  git config submodule.weights.url ${srcdir}/oidn-weights
  git submodule update --init --recursive # --remote
}

#pkgver() {
#  cd ${srcdir}/${pkgname}
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  cd ${srcdir}
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_PREFIX=/usr/ ../${pkgname}
  make 
}

package() {
  cd ${srcdir}/build
  make install DESTDIR=${pkgdir}
}

# vim:set ts=2 sw=2 et:
