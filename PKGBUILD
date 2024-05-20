# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=zaproxy-weekly
pkgver=2024_05_20
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, weekly Pre-release'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('any')
license=('Apache-2.0')
depends=('java-runtime' 'ttf-font')
source=(ZAP_WEEKLY_D-${pkgver//_/-}.zip::https://github.com/zaproxy/zaproxy/releases/download/w${pkgver//_/-}/ZAP_WEEKLY_D-${pkgver//_/-}.zip)
sha256sums=('c681e3ae186701914478b91240420f07306a2ce33bd433792950fe5bdac01eef')
b2sums=('80b6313cd2acd373030bb709ce5f429f7a69fd914e25b5001460d5dffdc3498dd09c746d28953d98d603c478d0d175c3e56c7d3228e84c1e1523b71dfe5b40fc')

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
