# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=geomyidae
pkgver=0.69
pkgrel=1
pkgdesc='Small C-based gopherd'
arch=('x86_64')
url='https://gopher.floodgap.com/gopher/gw?gopher://bitreich.org:70/1/scm/geomyidae/file/README.gph'
license=('MIT')
depends=( 'libretls>=3.5.2' )
backup=('var/gopher/CGI'
        'var/gopher/index.gph')
source=("ftp://bitreich.org/releases/${pkgname}/${pkgname}-v${pkgver}.tar.lz")
b2sums=(
  'c52dc2ad1460037bb6248796dc315cf3c67eab9f229ae8f4e15e50511d441ba6c71ba81280486207211b9cde01b3db627c968a2eabe745cef36c63069e8cb7f5'
)

build() {
  make -C "${pkgname}-v${pkgver}"
}

package() {
  cd "${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 -t "${pkgdir}/var/gopher" index.gph
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" {LINKS,README}
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/rc.d" 'rc.d/'*
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${startdir}/LICENSE"
}

# vim: ts=2 sw=2 et:
