# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>

pkgname=wwphone
pkgver=3.4.31
pkgrel=1
pkgdesc="A proprietary CTI and SIP client from wwcom"
arch=('x86_64')
license=('custom:"Copyright (c) 2022 by wwcom ag"')
url="https://www.wwcom.ch/"

source=("https://wwcom.ch/downloads/wwphone_${pkgver//./_}.deb")
sha256sums=('f3f69f680e584379bd3171f60ec1257908f7fa193131e70165b710c3167ab034')

depends=(
  "alsa-lib"
  "gtk-engine-murrine"
  "gtk2"
  "hidapi"
  "libappindicator-gtk3"
  "libpulse"
  "libxss"
)


package() {
  cd "${srcdir}"

  tar -xf data.tar.xz

  install -d "${pkgdir}"/opt/wwphone/certs
  install -m 0644 opt/wwphone/certs/* "${pkgdir}"/opt/wwphone/certs
  install -d "${pkgdir}"/opt/wwphone/locale
  install -m 0644 opt/wwphone/locale/* "${pkgdir}"/opt/wwphone/locale
  install -d "${pkgdir}"/opt/wwphone/themes/adwaitax/pixmap
  install -m 0644 opt/wwphone/themes/adwaitax/gtkrc "${pkgdir}"/opt/wwphone/themes/adwaitax
  install -m 0644 opt/wwphone/themes/adwaitax/pixmap/* "${pkgdir}"/opt/wwphone/themes/adwaitax/pixmap
  install -m 0644 opt/wwphone/{*.wav,wwphone.png} "${pkgdir}"/opt/wwphone
  install -m 0644 opt/wwphone/libjabra.so.1.10.1.0 "${pkgdir}"/opt/wwphone/libjabra.so.1.10.1.0
  install -m 0755 opt/wwphone/wwphone "${pkgdir}"/opt/wwphone/wwphone

  install -Dm 0644 opt/wwphone/license.txt "${pkgdir}"/usr/share/licenses/$pkgname/license.txt
  install -Dm 0755 usr/local/bin/wwphone "${pkgdir}"/usr/bin/wwphone
  install -Dm 0644 usr/share/applications/wwphone.desktop "${pkgdir}"/usr/share/applications/wwphone.desktop
  sed -e 's|/usr/local/bin|/usr/bin|' -i "${pkgdir}"/usr/share/applications/wwphone.desktop
}
