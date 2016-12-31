# Maintainer: jerry73204 <jerry73204@gmail.com>
# Former Maintainer: Govind Gopakumar < govind.93 at gmail dot com>
# Former Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=2.1.1
pkgrel=1
pkgdesc='a scalable c++ machine learning library'
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('BSD')
depends=('armadillo>=4.100.0'
         'boost>=1.49'
         'lapack'
         'libxml2>=2.6.0')
makedepends=('cmake>=2.8.5' 'txt2man')
source=("http://www.mlpack.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c2249bbab5686bb8658300ebcf814b81ac7b8050a10f1a517ba5530c58dbac31')

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

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
