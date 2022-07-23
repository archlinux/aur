pkgname=ngircd
pkgver=26.1
pkgrel=2
pkgdesc="Next Generation IRC Daemon compiled with PAM support"
arch=('x86_64')
backup=(etc/ngircd.conf)
url="https://ngircd.barton.de/"
license=('GPL')
conflicts=('ngircd')
depends=('openssl' 'libident' 'zlib')
source=("https://ngircd.barton.de/pub/ngircd/ngircd-$pkgver.tar.gz"{,.sig}
        ngircd.service)
sha256sums=('41e1b1c6326c667a6a07799c34175b5406e78ec3b19b4b780046c8d3f532706e'
            'SKIP'
            'f02e30f6864ba1130bcc85bedc44ad782687f572c06f10e0501b0ddcf532b404')
validpgpkeys=('47ECB2F6D427373730E901138A459AD2EAA15A24') # Alexander Barton <alex@barton.de>

build() {
  cd "$srcdir/ngircd-$pkgver"

  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--sbindir=/usr/bin \
  	--mandir=/usr/share/man \
  	--with-ident \
  	--with-openssl \
  	--with-pam \
  	--enable-ipv6
  make
}

package() {
  cd "$srcdir/ngircd-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 ../ngircd.service "$pkgdir/usr/lib/systemd/system/ngircd.service"
}

# vim:set ts=2 sw=2 et:
