# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=sendip
pkgver=2.5
_pkgver=3
pkgrel=7
pkgdesc='A commandline tool to allow sending arbitrary IP packets'
arch=('i686' 'x86_64' )
url='https://www-x.antd.nist.gov/ipv6/sendip.html'
license=('GPL')
depends=('glibc')
source=("https://www-x.antd.nist.gov/ipv6/sendip/sendip-${pkgver}-mec-3a2.tar.gz"
        ${pkgname}-${pkgver}.patch)
b2sums=('64bff2af3ea4b788bf98fe108417bb39493b1e26225247f1b625dd48443993bf5417bc3815ac107a3505133f8c0480f29f7384ced1ae1cb44281f2d0984272a4'
        'f4414aeffef0eecb7da088b3a11820dc87e118f791e330a78c9ec9c623867757eb543787e68ac6873e12179b3de51a146efaef8335ed61e5bd7c00391d21b4ca')

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
