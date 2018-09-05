# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20180829
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('cad8adf93ad6e2962f3faf8dff472da9656837d08a1b72cfde17532cb0581b70a3e5f172002affc7a7b3d23e158cb19c03fe16b6ba80b765567876d53eff0550')

package() {
  local cert_tag='icp_br'
  find * -print0 | while read -d $'\0' cert; do
      # Remove whitespaces from filenames
    mv "$cert" "$cert_tag.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -m0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
