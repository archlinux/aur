# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>

pkgname=wwphone
pkgver=4.0.14
pkgrel=1
pkgdesc="A proprietary CTI and SIP client from wwcom"
arch=('x86_64')
license=('custom:"Copyright (c) 2022 by wwcom ag"')
url="https://www.wwcom.ch/"

source=("https://wwcom.ch/downloads/wwphone_${pkgver//./_}.deb")
sha256sums=('4e81da5b37a428c3e8e634b96691272284dd43bf24608c2cc9a1c8a41e7d5be5')

depends=(
  "alsa-lib"
  "gtk3"
  "hidapi"
  "libappindicator-gtk3"
  "libpulse"
  "libxss"
  "openssl-1.1"
  "xdg-utils"
)

optdepends=(
  "xclip: select/copy clipboard call support"
)

package() {
  cd "${srcdir}"

  tar -xf data.tar.xz

  install -d "${pkgdir}"/opt/wwphone/certs
  install -m 0644 opt/wwphone/certs/* "${pkgdir}"/opt/wwphone/certs
  install -m 0644 opt/wwphone/Dark "${pkgdir}"/opt/wwphone/Dark
  install -m 0644 opt/wwphone/{*.wav,wwphone.png} "${pkgdir}"/opt/wwphone
  install -m 0644 opt/wwphone/libjabra.so.1.12.2.0 "${pkgdir}"/opt/wwphone/libjabra.so.1.12.2.0
  install -m 0644 opt/wwphone/libjabra.so.1 "${pkgdir}"/opt/wwphone/libjabra.so.1
  install -m 0755 opt/wwphone/wwphone "${pkgdir}"/opt/wwphone/wwphone
  install -m 0755 opt/wwphone/ctc "${pkgdir}"/opt/wwphone/ctc

  install -Dm 0644 opt/wwphone/license.txt "${pkgdir}"/usr/share/licenses/$pkgname/license.txt
  install -Dm 0755 usr/local/bin/wwphone "${pkgdir}"/usr/bin/wwphone
  install -Dm 0644 usr/share/applications/wwphone.desktop "${pkgdir}"/usr/share/applications/wwphone.desktop
  sed -e 's|/usr/local/bin|/usr/bin|' -i "${pkgdir}"/usr/share/applications/wwphone.desktop
}
