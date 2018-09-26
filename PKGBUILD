# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20180926
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('a958236d541d73b26f392c1f51352092f891e18cad35c684f8a10c457bf5e3e057dcaefc3efbba0ecd32d051c3afee830c1277532a00709b3a42407951117a91')

package() {
  local cert_tag='icp_br'
  find * -print0 | while read -d $'\0' cert; do
      # Remove whitespaces from filenames
    mv "$cert" "$cert_tag.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -vm0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
