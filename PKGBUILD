# Maintainer: Christophe Robin <crobin at nekoo a-dot com>

pkgname=couchbase-server-community
pkgver=4.5.1
pkgrel=1
pkgdesc="A document database featuring a powerful query language and unrivaled performance at scale."
arch=('x86_64')
url="http://www.couchbase.com/"
source=(
  "${pkgname}-v${pkgver}.deb::http://packages.couchbase.com/releases/${pkgver}/${pkgname}_${pkgver}-ubuntu14.04_amd64.deb"
  "couchbase-server.service"
)
install=couchbase-server.install
makedepends=(chrpath)
depends=(glibc gcc-libs sqlite openssl ncurses5-compat-libs zlib python2 libopenssl-1.0-compat)
conflicts=(couchbase3-server-community)

package() {
  msg2 "Extracting the data.tar.gz"
  tar -xf data.tar.xz -C "${pkgdir}/"

  chrpath -r "/usr/lib/openssl-1.0-compat:/usr/lib:/usr/local/lib" "${pkgdir}/opt/couchbase/lib/erlang/lib/crypto-3.2/priv/lib/crypto.so"

  # remove init.d and replace by systemd definition
  rm -Rf "${pkgdir}/etc"
  install -D couchbase-server.service "${pkgdir}/usr/lib/systemd/system/couchbase-server.service"
}

md5sums=('b15ba0ebdc14f7ed62b8127cebd582ea'
         '5126e004422c1a5b9391602ac9208319')
