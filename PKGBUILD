# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=simdock
pkgver=1.5.3
pkgrel=2
pkgdesc="Small dock with pseudo-transparency and good window handling"
arch=('i686' 'x86_64')
url="https://github.com/onli/simdock"
license=('GPL2')
depends=('libwnck' 'gconf' 'librsvg')
provides=('simdock')
conflicts=('simdock')
source=("simdock-${pkgver}.tar.gz::https://github.com/onli/simdock/archive/${pkgver}.tar.gz"
        "https://github.com/onli/simdock/raw/210f85511f9f3d198158a676189d72029c4bed2e/simdock.desktop")
sha256sums=('b1c2b8f0f79463b5348781f739896dc89c31ca4fb976fdbdd2b0aaa94324aca3'
            'ee32aa3a33601bcaf38d6049daf86df3957cf92985a4edecdabce849ae46ebac')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Desktop entry
  install -Dm644 "${srcdir}"/simdock.desktop "${pkgdir}"/usr/share/applications/simdock.desktop
}
