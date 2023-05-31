# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=multi-tpm2-totp
pkgver=0.2.0
pkgrel=1
pkgdesc='Attest the trustworthiness of a device against a human using multiple time-based one-time passwords.'
arch=(any)
url='https://github.com/brandsimon/multi-tpm2-totp'
license=(MIT)
depends=(tpm2-totp)
checkdepends=(shellcheck)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/multi-tpm2-totp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d9e610d543a215323d2275d967892b259a50ace196edc5313f95b8e213b7f8e0be6bf5a9403f2313e7ba8e99d0991b48bf882ebfc2904470e2543f37bf1c7640')
b2sums=('eaeddfb1ea7ed13e3b47939381de8bc718b733fe4076ccc5fedf2b2a166e115cd411b59f7393ef6ef691f448c2448e301ddbae8aaf574ad6a6f6886e1b3710b5')

check() {
  cd "${pkgname}-${pkgver}"
  shellcheck usr/lib/initcpio/install/* usr/lib/multi-tpm2-totp/*
}

package() {
  cd "${pkgname}-${pkgver}"
  install -dm 755 "${pkgdir}/etc/multi-tpm2-totp"
  install -dm 755 "${pkgdir}/usr/lib/multi-tpm2-totp"
  install -dm 755 "${pkgdir}/usr/lib/initcpio/install"
  install -dm 755 "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 usr/lib/initcpio/install/multi-tpm2-totp "${pkgdir}/usr/lib/initcpio/install/multi-tpm2-totp"
  install -Dm 644 usr/lib/systemd/system/multi-tpm2-totp.service "${pkgdir}/usr/lib/systemd/system/multi-tpm2-totp.service"
  install -Dm 644 usr/lib/multi-tpm2-totp/show.sh "${pkgdir}/usr/lib/multi-tpm2-totp/show.sh"
}
