pkgname=ro-cei-cert
pkgver=1.0.0
pkgrel=1
pkgdesc='Romanian electronic identity card root and sub-CA certificates'
arch=('any')
url='https://hub.mai.gov.ro/cei/info/descarca-cert'
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
install=ro-cei-cert.install

RO_CEI_CERT_ZIP_LINK='https://hub.mai.gov.ro/cei/info/descarca-cert'
source=("certificates.zip::${RO_CEI_CERT_ZIP_LINK}")
sha256sums=('b121c025d836fefadaf94c0dcfe0f24427c72b46b587de27ec2e77e0da115feb')

package() {
  local trust_dir="${pkgdir}/usr/share/ca-certificates/trust-source/anchors"

  unzip -jo "${srcdir}/certificates.zip" \
    'ro_cei_mai_root-ca.cer' \
    'ro_cei_mai_sub-ca.cer' \
    -d "${srcdir}"

  install -Dm644 "${srcdir}/ro_cei_mai_root-ca.cer" \
    "${trust_dir}/ro_cei_mai_root-ca.crt"
  install -Dm644 "${srcdir}/ro_cei_mai_sub-ca.cer" \
    "${trust_dir}/ro_cei_mai_sub-ca.crt"
}
