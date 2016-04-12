# Maintainer: jerry73204 <jerry73204@gmail.com>
# Former Maintainer: Govind Gopakumar < govind.93 at gmail dot com>
# Former Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=2.0.1
pkgrel=2
pkgdesc='a scalable c++ machine learning library'
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('armadillo>=4.100.0'
         'boost>=1.49'
         'lapack'
         'libxml2>=2.6.0')
makedepends=('cmake>=2.8.5' 'txt2man')
source=("http://www.mlpack.org/files/${pkgname}-${pkgver}.tar.gz"
        'kmeans_impl.patch')
sha1sums=('27df05cff83d202f5d64a3d3fa4bdc4d9a6bc4be'
          '0d9801873e44d340185081b9d1398bf60a37771b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < "${srcdir}/kmeans_impl.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -D CMAKE_INSTALL_PREFIX="${pkgdir}/usr" -D DEBUG=OFF -D PROFILE=OFF .
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make mlpack_test
  bin/mlpack_test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install
}
