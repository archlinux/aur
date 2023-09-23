# Contributor: loserMcloser  <reebydobalina at gmail dot com>
# Contributor: Erik Johnson <palehose at gmail dot com>
# Contributor: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>
# Maintainer: Amirhossein Zeinali <amirhossein.zeinlai22@gmail.com>

pkgname=djmount
pkgver=0.71.1
pkgdesc="A UPnP AV client that mounts media server contents as a filesystem."
pkgrel=0
arch=('i686' 'x86_64')
url="http://djmount.sourceforge.net/"
license=('GPL')
depends=('fuse')
source=(
 "https://github.com/amiri82/djmount/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
  djmount.confd  djmount.service  djmount.tmpfilesd  djmount.install
)
install='djmount.install'
md5sums=('b1dff512c5709d3a4d98d53113985954'
         'c8315155d514a281388e096d10982033'
         'c3ead49b87f0c08ff6b9d9edb5deede2'
         'b516e86eb1afd044913a595804b7144f'
         '5913bb8387d4497a96117fba8f2b71f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  install -D -m644 $srcdir/djmount.confd $pkgdir/etc/conf.d/djmount
  install -D -m644 $srcdir/djmount.service $pkgdir/usr/lib/systemd/system/djmount.service
  install -D -m644 $srcdir/djmount.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/djmount.conf
}
