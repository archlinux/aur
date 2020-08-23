# Submitter: TDY <tdy@archlinux.info>
# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=fsvs
pkgver=1.2.9
pkgrel=1
pkgdesc="A fast system versioning tool via subversion backend"
arch=('i686' 'x86_64')
url="https://doc.fsvs-software.org/"
license=('GPL3')
depends=('pcre' 'subversion')
options=('!buildflags')
source=(http://download.$pkgname-software.org/$pkgname-$pkgver.tar.bz2)
md5sums=('b1e185e9da6381da651f6d17d385226c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS="/usr/lib/libdl.so.2 -Wl,-z,noexecstack" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 doc/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 doc/$pkgname-groups.5 "$pkgdir/usr/share/man/man5/$pkgname-groups.5"
  install -cm644 doc/$pkgname-{h,o,u}*.5 "$pkgdir/usr/share/man/man5/"
}
