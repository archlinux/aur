# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20171117
pkgrel=2
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('GPL')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('ee05d52b5a0093028333d98ffc59f168a2fe43e825afd632aeebf6cfe78d22a118066aaf748741fdfdde19417f311f605f769ca8c90c313879b2f6482f90a084')

package() {
  local cert_tag='icp_br'
  find * -print0 | while read -d $'\0' cert; do
      # Remove whitespaces from filenames
    mv "$cert" "$cert_tag.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -m0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
