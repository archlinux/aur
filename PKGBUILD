# Maintainer: loafer <davemorgan353 at btinternet dot com>

pkgname=super
pkgver=3.30.0
pkgrel=3
pkgdesc="A setuid-root program - provides restricted access to setuid-root commands, and a safe execution environment for scripts"
arch=('i686' 'x86_64')
url="http://www.ucolick.org/~will/#super"
license=('GPL' 'Artistic License')
depends=('glibc' 'pam')
backup=('etc/super/super.tab')
source=(http://www.ucolick.org/~will/RUE/$pkgname/$pkgname-$pkgver-tar.gz)
md5sums=('87e965eb56577d6ce32b8560aa16d097')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --sysconfdir=/etc/super \
    --localstatedir=/var/lib/super \
    --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m644 sample.tab "$pkgdir/etc/$pkgname/sample.tab"
}
