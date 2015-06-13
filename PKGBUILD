# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=bootp
pkgver=2.4.3_18
pkgrel=1
pkgdesc="A BOOTP server"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/bootp"
# ftp://ftp.ntplx.net/pub/networking/bootp/
license=('custom')
depends=('glibc')
backup=(etc/bootptab)
source=(http://archive.ubuntu.com/ubuntu/pool/universe/b/bootp/bootp_${pkgver%_*}.orig.tar.gz \
        http://archive.ubuntu.com/ubuntu/pool/universe/b/bootp/bootp_${pkgver/_/-}.diff.gz \
        LICENSE)
md5sums=('2a12d862f11908acf84652387be4e03b'
         '27ca3263bc57db7635851ce1599e0ee9'
         '73d382f2d16e5e7e5306bbca14062613')

build() {
  cd "$srcdir/$pkgname-${pkgver%_*}"
  patch -Np1 < ../bootp_${pkgver/_/-}.diff || true
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver%_*}"

  install -d -m755 "$pkgdir"/usr/sbin
  install -d -m755 "$pkgdir"/usr/share/man/{man5,man8}
  install -d -m755 "$pkgdir"/etc

  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install.man

  touch "$pkgdir"/etc/bootptab

  install -D -m644 "$srcdir/"LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
