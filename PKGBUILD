# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=sxcs
pkgver=1.1.0
pkgrel=1
pkgdesc="minimal X11 color picker and magnifier"
arch=('i686' 'x86_64')
url="https://codeberg.org/NRK/sxcs"
license=('GPL3')
depends=('libx11' 'libxcursor')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('23cd9aef9d590172744c90083480786d0b20945e9c2eea2061d379bbdf7f3748')

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
