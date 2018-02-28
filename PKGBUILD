# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20180228
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('GPL')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('5cea5170cf93e33f27d634654ea8afb710037c0f70cf551413c6750c6f908a0a4be85bd4e27e571c0fdb4e82ade021841675ad9b780f66b7ab6bb9613d259964')

package() {
  local cert_tag='icp_br'
  find * -print0 | while read -d $'\0' cert; do
      # Remove whitespaces from filenames
    mv "$cert" "$cert_tag.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -m0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
