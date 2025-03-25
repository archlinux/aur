# Maintainer: sathariel <sathariel at diroot dot org>

pkgname=zaproxy-bin
pkgver=2.16.1
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, binary package'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('x86_64')
license=('Apache-2.0')
depends=('java-runtime' 'ttf-font')
source=(ZAP_${pkgver}_Linux.tar.gz::https://github.com/zaproxy/zaproxy/releases/download/v${pkgver}/ZAP_${pkgver}_Linux.tar.gz)
sha256sums=('5b2eb8319b085121a6e8ad50d69d67dbef8c867166f71a937bfc888d247a2ac1')
b2sums=('35cf3ad88764024312f76ae6af9b0c4973aca5457aa6d1d96114146fe49af5b0880417d2de7fe13083e5c0f1d97bfb5860ffa5ffca0665e039deb015cdf595dd')

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
