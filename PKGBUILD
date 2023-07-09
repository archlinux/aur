# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=sxcs
pkgver=0.7.3
pkgrel=1
pkgdesc="minimal X11 color picker and magnifier"
arch=('i686' 'x86_64')
url="https://codeberg.org/NRK/sxcs"
license=('GPL3')
depends=('libx11' 'libxcursor')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('ba15e8f49040adcba7b4498e6c3567a7514d0e25c6f74d195e44f58f933c68f3')

build() {
  cd "${pkgname}"

  export CC="${CC:-gcc}"

  ${CC} -o sxcs sxcs.c ${CFLAGS} ${LDFLAGS} -s -lX11 -lXcursor
}

package() {
  cd "${pkgname}"

  install -Dm755 sxcs "${pkgdir}/usr/bin/sxcs"
  install -Dm644 sxcs.1 "${pkgdir}/usr/share/man/man1/sxcs.1"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
