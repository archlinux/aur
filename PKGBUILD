# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=geomyidae
pkgver=0.34
pkgrel=1
pkgdesc='Small C-based gopherd'
arch=('x86_64')
url='https://gopher.floodgap.com/gopher/gw?gopher://bitreich.org:70/1/scm/geomyidae/file/README.gph'
license=('MIT')
backup=('var/gopher/CGI'
        'var/gopher/index.gph')
source=("ftp://bitreich.org/releases/${pkgname}/${pkgname}-v${pkgver}.tgz")
sha256sums=('2580ad0f229cd3f5c33495975a708679aeaf5276c06ec8d55871d7f69b216eb0')

build() {
  make -C "${pkgname}-v${pkgver}"
}

package() {
  cd "${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 -t "${pkgdir}/var/gopher" {CGI,index.gph}
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" {LINKS,README}
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/rc.d" 'rc.d/'*
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
