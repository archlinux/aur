# Maintainer: Alexandria Pettit <alxpettit@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ngircd-pam
pkgver=24
pkgrel=2
pkgdesc="Next Generation IRC Daemon compiled with PAM support"
arch=('x86_64')
backup=(etc/ngircd.conf)
url="http://ngircd.barton.de/"
license=('GPL')
conflicts=('ngircd')
depends=('openssl' 'libident' 'zlib')
source=("http://ngircd.barton.de/pub/ngircd/ngircd-$pkgver.tar.gz"
        ngircd.service)
sha256sums=('3e00a7da52c81fc1e02bb996a27bf43da905ba7037bf8c6bb3bd13321e0c85ab'
            'f02e30f6864ba1130bcc85bedc44ad782687f572c06f10e0501b0ddcf532b404')

build() {
  cd "$srcdir/ngircd-$pkgver"

  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--sbindir=/usr/bin \
  	--mandir=/usr/share/man \
  	--with-ident \
  	--with-openssl \
  	--enable-ipv6 \
    --with-pam
  make
}

package() {
  cd "$srcdir/ngircd-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 ../ngircd.service "$pkgdir/usr/lib/systemd/system/ngircd.service"
}

# vim:set ts=2 sw=2 et:
