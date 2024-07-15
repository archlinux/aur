# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=zaproxy-weekly
pkgver=2024_07_15
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, weekly Pre-release'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('any')
license=('Apache-2.0')
depends=('java-runtime' 'ttf-font')
source=(ZAP_WEEKLY_D-${pkgver//_/-}.zip::https://github.com/zaproxy/zaproxy/releases/download/w${pkgver//_/-}/ZAP_WEEKLY_D-${pkgver//_/-}.zip)
sha256sums=('0c1b6e9b78c9195542d979c995fd85889f9564f05f3552f550db68fe2fd9b2f3')
b2sums=('38aaa6994259b40b47dc80a8ec9f44749c41c7661db31e46d16b1d7fd3711dd6374754871804170c05ec5f5ced08accc240f792292d1a844ce1821f892a29b20')

prepare() {
  cd ZAP_D-${pkgver//_/-}
  cat > zaproxy <<EOF
#!/bin/sh
cd /usr/share/zaproxy
./zap.sh
cd -
EOF
}

package() {
  cd ZAP_D-${pkgver//_/-}
  rm plugin/*macos* plugin/*windows*
  install -d "${pkgdir}/usr/share/zaproxy"
  cp -pR . "${pkgdir}/usr/share/zaproxy"
  install -Dm 755 zaproxy "${pkgdir}/usr/bin/zaproxy"
}

# vim: ts=2 sw=2 et:
