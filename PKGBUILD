# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-dnie
pkgver=2022422
pkgrel=1
pkgdesc="Spanish DNIE root certificates"
arch=('any')
url='http://www.dnielectronico.es'
license=('unknown')
depends=('ca-certificates-utils'
         'ca-certificates-fnmt'
         )
makedepends=('convmv')
source=(
        # Autoridad de Certificación Raíz del DNIe
        "ACRAIZ-DNIE2_${pkgver}.zip::https://www.dnielectronico.es/ZIP/ACRAIZ-DNIE2.zip"
        "ACRAIZ-SHA2_${pkgver}.zip::https://www.dnielectronico.es/ZIP/ACRAIZ-SHA2.zip"
        # Autoridades de Certificación, AC Subordinadas
        "ACDNIE004.crt_${pkgver}.zip::https://www.dnielectronico.es/ZIP/ACDNIE004.crt.zip"
        "ACDNIE005.crt_${pkgver}.zip::https://www.dnielectronico.es/ZIP/ACDNIE005.crt.zip"
        "ACDNIE006.crt_${pkgver}.zip::https://www.dnielectronico.es/ZIP/ACDNIE006.crt.zip"
        # Autoridad de Validación AV DNIE FNMT
        "Certificados_OCSP_Responder_FNMT_${pkgver}.zip::https://www.dnielectronico.es/descargas/certificados/Certificados_OCSP_Responder_FNMT.zip"
        )
sha256sums=('6e0235376d543d19c7fa765b66ec14fab785e0fb6076b16682649eb3934655bd'
            'cbb602e2e7f743b7190398960a64d5e71792bec6f468d2bdded414547d367edd'
            '7571df00556f41af9b552982f102529c20adb597fafe0865ccee89f735193458'
            '948ca3f851a4fd11483af67761c4d0603036231ec0611fe06d0e93212ac4d172'
            '25588e7328336f999a2650f60041f5fc107f1709960636b4a14b84cd8b866d54'
            '78eb0dbacbced15f9a53292ffeed57efbe8e58efc9cec5397d439fa77028f675'
            )
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
  convmv -f cp437 -t utf-8 -r --notest --replace "Certificados OCSP Responder_FNMT_Renovaci"*
}

package() {
  install -Dm644 "ACRAIZ-SHA2.cer"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_SHA2.cer"
  install -Dm644 "AC RAIZ DNIE 2.crt"                                                                         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_RAIZ_DNIE_2_SHA2.crt"
  install -Dm644 "AC DNIE 004.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_004_SHA2.crt"
  install -Dm644 "AC DNIE 005.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_005_SHA2.crt"
  install -Dm644 "AC DNIE 006.crt"                                                                            "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AC_DNIE_006_SHA2.crt"
  install -Dm644 "Certificados OCSP Responder_FNMT_Renovación_Marzo_2022/AV DNIE FNMT.cer"                    "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/AV_DNIE_FNMT.cer"
  install -Dm644 "Certificados OCSP Responder_FNMT_Renovación_Marzo_2022/OCSP Responder DNIE 004.cer"         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_004.cer"
  install -Dm644 "Certificados OCSP Responder_FNMT_Renovación_Marzo_2022/OCSP Responder DNIE 005.cer"         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_005.cer"
  install -Dm644 "Certificados OCSP Responder_FNMT_Renovación_Marzo_2022/OCSP Responder DNIE 006.cer"         "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/OCSP_Responder_DNIE_006.cer"
}
