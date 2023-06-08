# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=multi-tpm2-totp
pkgver=0.2.1
pkgrel=1
pkgdesc='Attest the trustworthiness of a device against a human using multiple time-based one-time passwords.'
arch=(any)
url='https://github.com/brandsimon/multi-tpm2-totp'
license=(MIT)
depends=(tpm2-totp)
checkdepends=(shellcheck)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandsimon/multi-tpm2-totp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8d1d8305abcf2c732ca19ac110f378193210b30b78314e2f231ad67c64ee9c677108f9c2d15c53f0f4d7efad9ce391ea75fc18cbfeb3fb56654f55f98eeef897')
b2sums=('53b6b04ea44fef839773db41768fffdb6f304dc5023097005bd6f5e3140f73534eeda3d85e8bde7dfeb277ac0406003ab116d99f1cce024cf8809e76cfc4b712')

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
