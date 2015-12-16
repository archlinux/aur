# Maintainer: Christophe Robin <crobin at nekoo a-dot com>

pkgname=couchbase-server-community
pkgver=4.0.0
pkgrel=2
pkgdesc="A document database featuring a powerful query language and unrivaled performance at scale."
arch=('x86_64')
url="http://www.couchbase.com/"
source=(
  "${pkgname}-v${pkgver}.deb::http://packages.couchbase.com/releases/${pkgver}/${pkgname}_${pkgver}-ubuntu14.04_amd64.deb"
  "couchbase-server.service"
)
install=couchbase-server.install
depends=(glibc gcc-libs sqlite openssl libtinfo zlib)

package() {
  msg2 "Extracting the data.tar.gz"
  tar -xf data.tar.xz -C "${pkgdir}/"

  # remove init.d and replace by systemd definition
  rm -Rf "${pkgdir}/etc"
  install -D couchbase-server.service "${pkgdir}/usr/lib/systemd/system/couchbase-server.service"
}

md5sums=('950bf7eeebc139c1602d322d675e6d98'
         'd6d13dde7d40fb31e786623f3f16c3c2')
