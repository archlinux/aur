# Maintainer: Xianwen Chen <xianwen.chen@gmail.com>
# Contributors: 

pkgname=biogeme
pkgver_major=2
pkgver_minor=3
pkgver=${pkgver_major}.${pkgver_minor}
pkgrel=1
pkgdesc="an open source freeware designed for the estimation of discrete choice models"
arch=('i686' 'x86_64')
url="http://biogeme.epfl.ch/"
license=('custom:"BIOGEME"')
depends=(
    bison
    python
)
makedepends=(
    gcc
    make
    fakeroot
)
source=(
    "http://biogeme.epfl.ch/v${pkgver_major}${pkgver_minor}/biogeme-${pkgver}.tar.gz"
)
md5sums=(
    '54c41126745b7752b54a578655e1e7da'
) #autofill using updpkgsums

build() {
  cd biogeme-${pkgver}

  ./configure --prefix=/usr --enable-bison --enable-python
  make
}

package() {
  cd biogeme-${pkgver}

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
