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
            '8e198c18042e7d2fc3559315196ee0899738d2483ec2349f0f5e449e9a94758281900fd95bdb24c14a7b9e874c9452076ff5ab51ed573634e850655bbde48faa')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-mec-${_pkgver}"
  # reformat some while loops to prevent compilation errors
  patch -p1 < "${srcdir}/${pkgname}-${pkgver}.patch"
  sed -i 's|_BSD_SOURCE|_DEFAULT_SOURCE|' csum.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-mec-${_pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-mec-${_pkgver}"
  make PREFIX="${pkgdir}/usr" install
}
