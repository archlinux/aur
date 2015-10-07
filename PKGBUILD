# Maintainer: karronoli <karo+arch at karonori.com>
pkgname=redpen
_pkgver=1.4
pkgver=${_pkgver}.0
pkgrel=1
pkgdesc="A document checker. RedPen is a proofreading tool to help writers or programmers."
url="http://redpen.cc/"
arch=('any')
license=('Apache')
depends=('java-runtime>=8')
source=(https://github.com/redpen-cc/redpen/releases/download/v${pkgver}/redpen-${pkgver}.tar.gz)
sha256sums=('ad8d81e6dc67990055f4eacb0cb069bf7a17e50a6d45f471c655231f931554f3')

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/${pkgname}-distribution-${_pkgver}" "${srcdir}/${pkgname}"
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

