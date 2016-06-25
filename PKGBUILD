# Maintainer: jerry73204 <jerry73204@gmail.com>
# Former Maintainer: Govind Gopakumar < govind.93 at gmail dot com>
# Former Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=2.0.2
pkgrel=1
pkgdesc='a scalable c++ machine learning library'
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('LGPLv3')
depends=('armadillo>=4.100.0'
         'boost>=1.49'
         'lapack'
         'libxml2>=2.6.0')
makedepends=('cmake>=2.8.5' 'txt2man')
source=("http://www.mlpack.org/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('6038dbc9930e5699540cd51b5186d265f78cdb21')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
