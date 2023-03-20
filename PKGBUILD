# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=multi-tpm2-totp
pkgver=0.1.0
pkgrel=1
pkgdesc='Attest the trustworthiness of a device against a human using multiple time-based one-time passwords.'
arch=(any)
url='https://github.com/brandsimon/multi-tpm2-totp'
license=(MIT)
depends=(tpm2-totp)
checkdepends=(shellcheck)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/multi-tpm2-totp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4b73f57f450576bb8d49e59fa59c5c510f7dba3ad9cc632d68f1b972b22f07974330b68609442ae64b053fa4565e699e526cfa156c2fdbf718faa3b4f6fcc500')
b2sums=('c249862ef31f4e9702914e0b4ea850df4848fd5a0a56e19d0ac46e75fd4243d0ddc14bc15568ad4d9c6f80625db11df3f03a49bb45f40bb5bbad4b17bb45f988')

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
