# Maintainer: sathariel <sathariel at diroot dot org>

pkgname=zaproxy-bin
pkgver=2.16.0
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, binary package'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('x86_64')
license=('Apache-2.0')
depends=('java-runtime' 'ttf-font')
source=(ZAP_${pkgver}_Linux.tar.gz::https://github.com/zaproxy/zaproxy/releases/download/v2.16.0/ZAP_${pkgver}_Linux.tar.gz)
sha256sums=('a0779509e702ec53d41074eaa0ce41f2a964a822aa5be0380255a482e2e7fe8d')
b2sums=('8b4667150c91a891baeacbdb4c38e2e6d7c0ceaa5448fa3f06275ca1223a94fcae68ffea59b31ba00220ad2bb15eb0ad2c86480d0b8a39c1ba29ef7a54d63ec1')

prepare() {
  cd ZAP_${pkgver}
  cat > zaproxy <<EOF
#!/bin/sh
cd /usr/share/zaproxy
./zap.sh
cd -
EOF
}

package() {
  cd ZAP_${pkgver}
  install -d "${pkgdir}/usr/share/zaproxy"
  cp -pR . "${pkgdir}/usr/share/zaproxy"
  install -Dm 755 zaproxy "${pkgdir}/usr/bin/zaproxy"
}

# vim: ts=2 sw=2 et:
