# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20180419
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('19802274b32419e24e00879bd043e565d039b3d00532c5c4616b772b05349392781df05225b1d71d5f416365fdb3d954861e4fc9da922a9fde68f8f89d173ec9')

package() {
  local cert_tag='icp_br'
  find * -print0 | while read -d $'\0' cert; do
      # Remove whitespaces from filenames
    mv "$cert" "$cert_tag.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -m0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
