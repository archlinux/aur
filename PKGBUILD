# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=cloudsql-proxy
pkgver=1.10
pkgrel=1
pkgdesc="Google Cloud Platform - Cloud SQL Proxy"
arch=('x86_64' 'i686')
url="https://cloud.google.com/sql/docs/mysql/sql-proxy"
license=('APACHE')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/GoogleCloudPlatform/cloudsql-proxy/cmd/cloud_sql_proxy

build() {
  GOPATH="${srcdir}" go get -v -x ${_gourl}
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -p -m755 "${srcdir}/bin/"* "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/${GOPATH}"
  cp -Rv --preserve=timestamps "${srcdir}/"{src,pkg} "${pkgdir}/${GOPATH}"
}

# vim:set ts=2 sw=2 et:

