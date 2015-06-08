# Contributor: Pizon <pizon@pizon.org>
# Maintainer: Francesco Colista <francesco.colista@gmail.com>
pkgname=dkimproxy
pkgver=1.4.1
pkgrel=6
pkgdesc="An SMTP-proxy that signs and/or verifies emails, using the Mail::DKIM module."
arch=('i686' 'x86_64')
url="http://dkimproxy.sourceforge.net/"
license=('GPL')
depends=('perl-mail-dkim' 'perl-net-server' 'perl-error')
options=('!emptydirs')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
dkimproxy.in.initd dkimproxy.out.initd) 

md5sums=('3ecaa38a8c865a5b7682f7f261354218'
         'b2cc167d684590c0f84d6a0c58bc292f'
         '7f078a99ade398b44ba83210b378e84c')

build() {
  cd  "$srcdir"/dkimproxy-"$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc/dkimproxy
  make
}

package() {
  cd  "$srcdir"/dkimproxy-"$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dm644 ../dkimproxy.in.initd "$pkgdir"/usr/lib/systemd/system/dkimproxy_in.service
  install -Dm644 ../dkimproxy.out.initd "$pkgdir"/usr/lib/systemd/system/dkimproxy_out.service
}

