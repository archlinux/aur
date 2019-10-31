# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=sendip
pkgver=2.5
_pkgver=3
pkgrel=7
pkgdesc='A commandline tool to allow sending arbitrary IP packets.'
arch=('i686' 'x86_64' )
url='https://www-x.antd.nist.gov/ipv6/sendip.html'
license=('GPL')
depends=('glibc')
source=(https://www-x.antd.nist.gov/ipv6/sendip/sendip-${pkgver}-mec-3a2.tar.gz
        ${pkgname}-${pkgver}.patch)
sha512sums=('5ab1a7b58c41f795dde40c46c679e62926f9b9a69ba7a22caedc677a2cd32091b97a554d2f0915dc72aa1c4968daa5b8b080d0b442ee2c6cbbc43eb8ae9845ee'
            '1b72502f013cd905bf26c10d9f5e43e2ab9ac43f311a1e4c2f0d33de1578d5d125e0e5132f9c45fa89b67428ac20adcf093e3b56870c2d514d5bc1f1a8be8907')

prepare() {
  cd ${pkgname}-${pkgver}-mec-${_pkgver}
  # reformat some while loops to prevent compilation errors
  patch -p0 < "${srcdir}"/${pkgname}-${pkgver}.patch
}

build() {
  cd ${pkgname}-${pkgver}-mec-${_pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}-mec-${_pkgver}
  make PREFIX="${pkgdir}"/usr install
}
