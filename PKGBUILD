# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=geomyidae
pkgver=0.34
pkgrel=1
pkgdesc='Small C-based gopherd'
arch=('x86_64')
url='https://gopher.floodgap.com/gopher/gw?gopher://bitreich.org:70/1/scm/geomyidae/file/README.gph'
license=('MIT')
source=("ftp://bitreich.org/releases/${pkgname}/${pkgname}-v${pkgver}.tgz")
sha512sums=('55b7845c8b9fbee70b2e2bd71d2e3bb8e34c3029a1ea410cb39750763c81d5c31af8c703f7b673aa28fbfd61dd7915300ed4ff22f94c8430ac754681bc30ce41')

build() {
  make -C "${pkgname}-v${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C "${pkgname}-v${pkgver}" install
  install -d "${pkgdir}"{/var/gopher,/usr/share/doc/${pkgname}}
  install -m644 "${pkgname}-v${pkgver}/"{CGI,index.gph} "${pkgdir}/var/gopher/"
  install -m644 "${pkgname}-v${pkgver}/"{LINKS,README} "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -rf "${pkgname}-v${pkgver}/"{gph,rc.d} "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${pkgname}-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: