# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=geomyidae
pkgver=0.50.1
pkgrel=1
pkgdesc='Small C-based gopherd'
arch=('x86_64')
url='https://gopher.floodgap.com/gopher/gw?gopher://bitreich.org:70/1/scm/geomyidae/file/README.gph'
license=('MIT')
backup=('var/gopher/CGI'
        'var/gopher/index.gph')
source=("ftp://bitreich.org/releases/${pkgname}/${pkgname}-v${pkgver}.tar.lz")
sha512sums=(
  'ecfed96cd456ff0bafb09527abdf4d50183331f9b4462cdfc37cdcb1274dd72aa9304da2d962670a37503500b27713fd24a179691aa5d6a613776cf452319f24'
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
