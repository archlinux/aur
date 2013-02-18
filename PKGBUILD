# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=cccc
pkgver=3.1.4
pkgrel=2
pkgdesc="C and C++ Code Counter, code metrics also for Ada and Java files"
arch=('i686' 'x86_64')
url="http://cccc.sourceforge.net/"
depends=('gcc-libs')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/cccc/$pkgname-$pkgver.tar.gz
gcc47.patch)
md5sums=('7bd3ad868913a0beab2fde931737f928'
         'e1d2cb39fcac3f3c14eaff4f1e8f2825')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -e 's/su root -c "make -f install.mak"/make -f install.mak/' \
    -i makefile || return 1
  sed -e 's:/usr/local/bin:'$pkgdir'/usr/bin:' \
    -e 's/\$(MKDIR)/\$(MKDIR) -p/' -i install/install.mak || return 1
  patch -p1 < ../gcc47.patch

  make -j 1 || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
