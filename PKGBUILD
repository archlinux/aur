# Maintainer: karronoli <karo+arch at karonori.com>
pkgname=redpen
pkgver=1.4.2
pkgrel=1
pkgdesc="A document checker. RedPen is a proofreading tool to help writers or programmers."
url="http://redpen.cc/"
arch=('any')
license=('Apache')
depends=('java-runtime>=8')
source=(https://github.com/redpen-cc/redpen/releases/download/v${pkgver}/redpen-${pkgver}.tar.gz)
sha256sums=('20f672387555d0f5d5dc25271d60bec149a359278cc9df82248f2885c128da52')

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/${pkgname}-distribution-${pkgver}" "${srcdir}/${pkgname}"
  mv "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/redpen"
#!/bin/sh
exec '/opt/${pkgname}/bin/redpen' "\$@"
EOF
  chmod a+x "${pkgdir}/usr/bin/redpen"

  cat <<EOF > "${pkgdir}/usr/bin/redpen-server"
#!/bin/sh
exec '/opt/${pkgname}/bin/redpen-server' "\$@"
EOF
  chmod a+x "${pkgdir}/usr/bin/redpen-server"
}

