# Maintainer: sathariel <sathariel at diroot dot org>

pkgname=zaproxy-bin
pkgver=2.17.0
pkgrel=1
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications, binary package'
conflicts=('zaproxy')
url='https://github.com/zaproxy/zaproxy'
arch=('x86_64')
license=('Apache-2.0')
depends=('java-runtime' 'ttf-font')
source=(ZAP_${pkgver}_Linux.tar.gz::https://github.com/zaproxy/zaproxy/releases/download/v${pkgver}/ZAP_${pkgver}_Linux.tar.gz)
sha256sums=('efe799aaa3627db683b43f00c9c210aea0b75c00cc8f0a0f0434d12bb3ddde5a')
b2sums=('4f13dad82229e0d71a8792d76c38e52b4727dc1cd00b2fb195b74e376e8aa5a7091c64cbc739dc905bd994688983ad082f5e87f7f0b647a0c2ae6db7c738b569')

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
