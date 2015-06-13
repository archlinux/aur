# Maintainer: der_FeniX <derfenix@gmail.com>
pkgname=pica-pica-node
_pkgname=pica-pica
pkgver=0.5.3
pkgrel=2
pkgdesc="Pica Pica is a distributed instant messaging software that employs strong cryptography for communication protection"
arch=('i686' 'x86_64')
url="http://picapica.im/"
license=('BSD')
depends=('openssl' 'sqlite')
makedepends=('make')
optdepends=('pica-pica-client')
conflicts=('pica-pica')
backup=('etc/pica-node.conf')
source=(
  http://picapica.im/$_pkgname-$pkgver.tar.gz
  pica-node-rc.d
  pica-node.service
  )

md5sums=('5504d31cd3b309f61a77cf00415c30ad'
         'e49ad457bbfc51558a14ec64ad329728'
         '475db57d6074c734fec67be4419e7e51')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --disable-client --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m 0755 -D ../../pica-node-rc.d "$pkgdir/etc/rc.d/pica-node"
  install -m 0744 -D ../../pica-node.service "$pkgdir/usr/lib/systemd/system/pica-node.service"
}

# vim:set ts=2 sw=2 et:
