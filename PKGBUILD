# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20190409
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="https://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::https://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('7c4fe7611479cd4d2eae2cc8fb1de579ccf444657d2916f2ac31fa380b63bcde16c6011c8fde354d3efa6624b20b81b55e27922290aa229587ccc691442b2442')

package() {
  find * -print0 | while read -d $'\0' cert; do
      # Edit filenames removing whitespaces and prepending 'icp_br'
    mv "$cert" "icp_br.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -vm0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
