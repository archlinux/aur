# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
# $Id$

pkgname=tspc
pkgver=5.1
pkgrel=1
pkgdesc='Gateway6 client implementation of the Tunnel Setup Protocol from Hexago'
url="http://go6.net/4105/download.asp"
depends=('openssl')
conflicts=()
source=('http://go6.net/4105/file.asp?file_id=150' 'fix_missing_headers.patch')
md5sums=('5c5205dc58e82454a5d55a3efb4bf786' '0c7aa95083375dfdfb3cff6772a2987b')
arch=(i686 x86_64)
license=('BSD')

build() {
  cd $startdir/src
  patch -p1 < $startdir/src/fix_missing_headers.patch
  cd $startdir/src/tspc-advanced
  make all target=linux || return 1
  install -D bin/gw6c -m 0755 $startdir/pkg/usr/sbin/tspc
  install -D bin/gw6c.conf.sample -m 0600 $startdir/pkg/etc/tspc.conf.sample
}
