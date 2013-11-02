# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: snafu <regflx@web.de>
pkgname=genders
pkgver=1.20
pkgrel=1
pkgdesc="Static cluster configuration database used for cluster configuration management."
arch=('x86_64' 'i686')
url='https://computing.llnl.gov/linux/genders.html'
license=('GPL')
source=("http://sourceforge.net/projects/genders/files/genders/$pkgver-$pkgrel/$pkgname-$pkgver.tar.gz"
        '624078.patch')
md5sums=('26a3bc4b6d5eeae3ade7b719c6165d85'
         '76431ec248c0ee9a2d1b9971cc13ce57')
options=('!makeflags')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../624078.patch
  ./configure --prefix=/usr --without-python-extensions
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
