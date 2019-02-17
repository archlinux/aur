# Maintainer: Alexandria Pettit <alxpettit@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ngircd-pam
pkgver=25
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
sha256sums=('51915780519bae43da3798807e3bed60d887e4eaa728354aa6bb61cdbcda49ba'
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
