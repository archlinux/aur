# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20190123
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="https://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::https://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('1ca7ecbc2d4999ea079edcaa1057e96dcb4346507cace7d5c5b58cddf833c666c0f7995dc7b359793ffe8fb7996097f4c356448098c83681df584ebf40cd3f97')

package() {
  find * -print0 | while read -d $'\0' cert; do
      # Edit filenames removing whitespaces and prepending 'icp_br'
    mv "$cert" "icp_br.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -vm0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
