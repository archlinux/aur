# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

_name=inadyn
pkgname=inadyn-fork
pkgver=2.2.1
pkgrel=2
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('i686' 'x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
provides=('inadyn')
backup=('etc/inadyn.conf')
source=(https://github.com/troglobit/inadyn/releases/download/v$pkgver/$_name-$pkgver.tar.xz
        inadyn.conf)
sha256sums=('e7a74fcf8b7c069990940c0dc4d4d18071005be225667fdfcfa4156c44384579'
            'a8203feb57e02d52f2ce4857e0ee8193b51da945b5f6966d223dd04dc6efdcbc')

build() {
  cd $_name-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --enable-openssl
  make
}

package() {
  install -Dm600 inadyn.conf "$pkgdir/etc/inadyn.conf"

  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install-strip
}

