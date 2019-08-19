# Maintainer: johnnybash <georgpfahler at wachenzell dot org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=zaproxy-weekly
pkgver=2019_08_19
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, weekly Pre-release'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('any')
license=('Apache')
depends=('java-runtime' 'ttf-font')
source=(ZAP_WEEKLY_D-${pkgver//_/-}.zip::https://github.com/zaproxy/zaproxy/releases/download/w${pkgver//_/-}/ZAP_WEEKLY_D-${pkgver//_/-}.zip)
sha256sums=('e0b856cf47fafae546bc0d24f2ca2e9ac7a7b9ef5699874987a693f02d824864')

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
