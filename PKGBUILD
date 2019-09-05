# Maintainer: Marco Pompili <aur (at) odd (dot) red>
# Contributor: Dennis Kempin <mail@dennis-kempin.de>

pkgname=boost-build
pkgver=4.0.0
pkgrel=1
pkgdesc="Boost.Build makes it easy to build C++ projects, everywhere."
arch=('any')
url="http://www.boost.org/build/"
license=('custom:boost')
depends=('gcc' 'boost' 'python')
conflicts=('boost-build-nightly')
source=("https://github.com/boostorg/build/archive/${pkgver}.tar.gz"
        "http://www.boost.org/LICENSE_1_0.txt")
sha256sums=('af615141c14858b67d71a278896523d3df0da0ff3c6495b6acf0ae2e8b44dd92'
            'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566')

prepare() {
  cd ${srcdir}/build-${pkgver}/

  ./bootstrap.sh
}

package() {
  cd ${srcdir}/build-${pkgver}/

  echo ${pkgdir}

  ./b2 install --prefix=${pkgdir}/usr

  # Removing b2 and bjam, already installed by boost
  msg2 "Removing /usr/bin/b2 and /usr/bin/bjam files, already installed by boost"
  rm -rf ${pkgdir}/usr/bin/

  install -Dm644 ${srcdir}/LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
