# Contributor: Ruslan Tokaev <polygynous@live.ru>
# Maintainer: Ruslan Tokaev <polygynous@live.ru>

pkgname=fehashmac
pkgver=1.4.2
pkgrel=1
pkgdesc="Generic Hash and HMAC Program"
arch=('i686' 'x86_64')
url="http://fehashmac.sourceforge.net/"
license=('GPL')
depends=(glibc)
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=(08ef4a3cdac97c19b519c003fe7d603a)

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
  --prefix=/usr \
  --exec-prefix=/usr \
  --bindir=/usr/bin \
  --sbindir=/usr/sbin \
  --libexecdir=/usr/lib/$pkgname \
  --sysconfdir=/etc \
  --libdir=/usr/lib \
  --includedir=/usr/include \
  --datarootdir=/usr/share/$pkgname \
  --mandir=/usr/share/man \
  --datadir=/usr/share/$pkgname \
  --enable-dependency-tracking \
  --sysconfdir=/etc

  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir prefix="$pkgdir/usr" install || return 1
}
