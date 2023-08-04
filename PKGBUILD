# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=multi-tpm2-totp
pkgver=0.2.2
pkgrel=1
pkgdesc='Attest the trustworthiness of a device against a human using multiple time-based one-time passwords.'
arch=(any)
url='https://github.com/brandsimon/multi-tpm2-totp'
license=(MIT)
depends=(tpm2-totp)
checkdepends=(shellcheck)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/multi-tpm2-totp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a1d9bf4d83fbe19c8518ff5065aef4b23043db81c1e0e7ba8235f736376c4f75d6d88e96ab8b07a473e4f202c16da78699373a775c3c55953bd3d4ff26b8b7b7')
b2sums=('5da77b8ccf0b70bbce8e2ed3cfbe611fdf08b28bac4f824811b8532cace0770d0ef0eea5bd5abf51caf8abb7cb08f7af0903a93d87a33d5c952bd4c610c26954')

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
  install -dm 755 "${pkgdir}/usr/share/licenses/multi-tpm2-totp"
  install -Dm 644 usr/lib/initcpio/install/multi-tpm2-totp "${pkgdir}/usr/lib/initcpio/install/multi-tpm2-totp"
  install -Dm 644 usr/lib/systemd/system/multi-tpm2-totp.service "${pkgdir}/usr/lib/systemd/system/multi-tpm2-totp.service"
  install -Dm 644 usr/lib/multi-tpm2-totp/show.sh "${pkgdir}/usr/lib/multi-tpm2-totp/show.sh"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/multi-tpm2-totp"
}
