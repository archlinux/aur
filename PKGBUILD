# Submitter: TDY <tdy@archlinux.info>
# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=fsvs
pkgver=1.2.5
pkgrel=2
pkgdesc="A fast system versioning tool via subversion backend"
arch=('i686' 'x86_64')
url="http://fsvs.tigris.org/"
license=('GPL3')
depends=('pcre' 'subversion')
options=('!buildflags')
source=(http://download.$pkgname-software.org/$pkgname-$pkgver.tar.bz2
  patch_gcc5_svn_r2472.diff)
md5sums=('d9c99d27b26e3edd48a6fd77c9f071ef'
  '27df7da37de1af603822236fcf75384b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 < ../../patch_gcc5_svn_r2472.diff
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

# vim:set ts=2 sw=2 et:
