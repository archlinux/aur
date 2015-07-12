# Maintainer: icasdri <icasdri *at* gmail.com>
# Based on automake-1.12 maintained by hav3lock

pkgname=automake-1.14
_realname=automake
pkgver=1.14.1
pkgrel=2
pkgdesc="A GNU tool for automatically creating Makefiles"
arch=('any')
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
provides="automake=1.14"
install=automake.install
source=(ftp://ftp.gnu.org/gnu/$_realname/$_realname-$pkgver.tar.gz)
md5sums=('d052a3e884631b9c7892f2efce542d75')

prepare () {
  cd "$srcdir/$_realname-$pkgver"
  ./configure --prefix=/usr
}

build () {
  cd "$srcdir/$_realname-$pkgver"
  make
}

package () {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/usr/"{bin/{aclocal,automake},share/{doc,aclocal}}

  rename "automake" "automake-1.14" "$pkgdir"/usr/share/info/*

  rm "$pkgdir/usr/share/man/man1/"{aclocal,automake}.1
}

