# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=zaproxy-weekly
pkgver=2023_12_04
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, weekly Pre-release'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('any')
license=('Apache')
depends=('java-runtime' 'ttf-font')
source=(ZAP_WEEKLY_D-${pkgver//_/-}.zip::https://github.com/zaproxy/zaproxy/releases/download/w${pkgver//_/-}/ZAP_WEEKLY_D-${pkgver//_/-}.zip)
sha256sums=('152d1ad5fd79268e9b6ea74bbcb6feec6cc03e7926ba105a2e530a92f6d7dc31')
b2sums=('ad47fb9fb586c81afe767d32cefe89df8562863e782b3cce615129228f343a0c1a4c6fff016f627e09a6fba1bc5a5a4e289eea1107c3d379f06097bd663cde96')

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
