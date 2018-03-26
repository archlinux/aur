# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=hypercube
pkgver=1.7.0
pkgrel=1
pkgdesc='Graph visualization tool'
arch=('i686' 'x86_64')
url="http://tumic.wz.cz/hypercube/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/tumic0/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e35e849feb2a58395f106ebd6d745bd2315bf215f089c12149372015b19e55dc')

build() {
  cd ${pkgname}-${pkgver}

  lrelease hypercube.pro
  qmake hypercube.pro
  make
}

package() {
  cd ${pkgname}-${pkgver}

  gzip hypercube.1

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/man/man1
  install -d 755 ${pkgdir}/usr/share/${pkgname}
  install -d 755 ${pkgdir}/usr/share/${pkgname}/examples

  install -m 755 hypercube ${pkgdir}/usr/bin/${pkgname}
  install -m 644 hypercube.1.gz ${pkgdir}/usr/share/man/man1
  install -m 644 examples/* ${pkgdir}/usr/share/${pkgname}/examples
}
