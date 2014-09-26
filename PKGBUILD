# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: snafu <regflx@web.de>
pkgname=genders
pkgver=1.21
pkgrel=1
pkgdesc="Static cluster configuration database used for cluster configuration management."
arch=('x86_64' 'i686')
url='https://computing.llnl.gov/linux/genders.html'
license=('GPL')
source=("http://sourceforge.net/projects/genders/files/genders/$pkgver-$pkgrel/$pkgname-$pkgver.tar.gz"
        '624078.patch')
md5sums=('8915780924dc4fa83432ea1c25907835'
         '4c5c7b85ee0641a66e885b647fd669fd')

options=('!makeflags')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../624078.patch
  # export CPPFLAGS="-I/usr/lib/jvm/default/include -I/usr/lib/jvm/default/include/linux ${CPPFLAGS}"
  ./configure --prefix=/usr               \
              --with-perl-vendor-arch     \
              --with-cplusplus-extensions \
              --without-java-extensions   \
              --without-python-extensions
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
