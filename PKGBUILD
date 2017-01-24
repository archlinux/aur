# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

_name=inadyn
pkgname=inadyn-fork
pkgver=2.1
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('i686' 'x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
#depends=('ca-certificates' 'confuse' 'openssl')
depends=('ca-certificates' 'confuse' 'libite' 'openssl')
provides=('inadyn')
backup=('etc/inadyn.conf')
source=(https://github.com/troglobit/inadyn/releases/download/v$pkgver/$_name-$pkgver.tar.xz
        inadyn.conf)
sha256sums=('87639a7c1ddc047074601ad60188279a2a0d9393367f046c153de0e24586b3ac'
            '4967d5fad250f38167b78c53862674afec7851f7c7bb648d00afe34db062bc60')

build() {
  cd $_name-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --enable-openssl
  make
}

package() {
  install -Dm600 inadyn.conf "$pkgdir/etc/inadyn.conf"

  cd $_name-$pkgver
  #install -Dm644 examples/dyndns.conf "$pkgdir/usr/share/inadyn/examples/dyndns.conf"
  #install -Dm644 examples/freedns.conf "$pkgdir/usr/share/inadyn/examples/freedns.conf"
  #install -Dm644 examples/custom.conf "$pkgdir/usr/share/inadyn/examples/custom.conf"
  make DESTDIR="$pkgdir" install
}

