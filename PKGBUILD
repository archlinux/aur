# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=zaproxy-weekly
pkgver=2023_07_12
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, weekly Pre-release'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('any')
license=('Apache')
depends=('java-runtime' 'ttf-font')
source=(ZAP_WEEKLY_D-${pkgver//_/-}.zip::https://github.com/zaproxy/zaproxy/releases/download/w${pkgver//_/-}/ZAP_WEEKLY_D-${pkgver//_/-}.zip)
sha256sums=('bf189db829efa9539405dbabeaa09c8625245d4361978486858518ea940e4639')
b2sums=('c59aa975afdb719f49f8655f1c9c8e1c44cd373d919b16acdd5a1dafe9ec6308356ef2f879317f2f53864d9a3001286f245486d205574eab2dba3a19b42d90ea')

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
