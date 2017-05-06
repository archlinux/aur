# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>
# Contributor: Dennis Kempin <mail@dennis-kempin.de>

pkgname=boost-build
pkgver=1.63
pkgrel=1
pkgdesc="Boost.Build makes it easy to build C++ projects, everywhere."
arch=('any')
url="http://www.boost.org/build/"
license=('custom:boost')
depends=('gcc' 'boost' 'python')
conflicts=('boost-build-nightly')
source=("https://github.com/boostorg/build/archive/boost-${pkgver}.0.tar.gz"
        "http://www.boost.org/LICENSE_1_0.txt")
sha256sums=('f15afc1a2636aa7876dd22122a13c4d1c8ce30317f9fcaebf93e64c8d42ffcad'
            'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566')

prepare() {
  cd ${srcdir}/build-boost-${pkgver}.0/

  ./bootstrap.sh
}

package() {
  cd ${srcdir}/build-boost-${pkgver}.0/

  echo ${pkgdir}

  ./b2 install --prefix=${pkgdir}/usr

  # Removing b2 and bjam, already installed by boost
  msg2 "Removing /usr/bin/b2 and /usr/bin/bjam files, already installed by boost"
  rm -rf ${pkgdir}/usr/bin/

  install -Dm644 ${srcdir}/LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
