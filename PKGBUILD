pkgname=redpen
_pkgver=1.3
pkgver=${_pkgver}.0
pkgrel=1
pkgdesc="A document checker. RedPen is a proofreading tool to help writers or programmers."
url="http://redpen.cc/"
arch=('any')
license=('Apache')
depends=('java-runtime')
source=(https://github.com/redpen-cc/redpen/releases/download/v${pkgver}/redpen-${pkgver}.tar.gz)
sha256sums=('3e3aa98fb83acb6c4db96dcc5c44e02fee211dc3edf0fad9cecf1eb374df3e8b')

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/${pkgname}-distribution-${_pkgver}" "${srcdir}/${pkgname}"
  mv "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/redpen"
#!/bin/sh
exec /opt/${pkgname}/bin/redpen \$@
EOF
  chmod a+x "${pkgdir}/usr/bin/redpen"

  # redpen-server fails to start...
  # No write permission to /opt/redpen/logs, can't change...
#   cat <<EOF > "${pkgdir}/usr/bin/redpen-server"
# #!/bin/sh
# exec /opt/${pkgname}/bin/redpen-server \$@
# EOF
#   chmod a+x "${pkgdir}/usr/bin/redpen-server"
}

