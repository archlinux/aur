# $Id: PKGBUILD,v 1.7 2007/11/16 00:02:40 daniel Exp $
# Maintainer:  Judd <jvinet@zeroflux.org>
pkgname=xinetd
pkgver=2.3.14
pkgrel=3
pkgdesc="xinetd is a secure replacement for inetd"
arch=(i686 x86_64)
url="http://www.xinetd.org/"
depends=('glibc' 'tcp_wrappers')
backup=('etc/xinetd.conf' 'etc/xinetd.d/servers' 'etc/xinetd.d/services')
source=(http://www.xinetd.org/xinetd-$pkgver.tar.gz xinetd.conf xinetd \
        servers services)
md5sums=('567382d7972613090215c6c54f9b82d9' 'f109f699a07bc8cfb5791060f5e87f9e'\
         'ea37a2794f202e6b953d9b6956dad16a' '21f47b4aa20921cfaddddd9f9a407f81'\
         '9fa2061dc7dd738c8424251deb86f81e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-libwrap
  make || return 1
  make prefix=$startdir/pkg/usr install
  install -D -m755 ../xinetd $startdir/pkg/etc/rc.d/xinetd
  install -D -m644 ../xinetd.conf $startdir/pkg/etc/xinetd.conf
  install -D -m644 ../servers $startdir/pkg/etc/xinetd.d/servers
  install -D -m644 ../services $startdir/pkg/etc/xinetd.d/services
}
