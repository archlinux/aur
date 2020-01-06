# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: snafu <regflx@web.de>
pkgname=genders
pkgver=1.27.3
pkgrel=1
pkgdesc="Static cluster configuration database used for cluster configuration management."
arch=('x86_64' 'i686')
url='https://computing.llnl.gov/linux/genders.html'
license=('GPL')
source=("https://github.com/chaos/${pkgname}/archive/${pkgname}-${pkgver//./-}.tar.gz"
        '624078.patch')
sha256sums=('c176045a7dd125313d44abcb7968ded61826028fe906028a2967442426229894'
            '7bd0e8bbf2e29ef00ee2387a1dd964cda841bc8995db85cf97b73c4dd766e699')

options=('!makeflags')

build() {
  cd "$srcdir/$pkgname-$pkgname-${pkgver//./-}"
  patch -p1 < ../624078.patch
  # export CPPFLAGS="-I/usr/lib/jvm/default/include -I/usr/lib/jvm/default/include/linux ${CPPFLAGS}"
  ./configure --prefix=/usr               \
              --with-perl-vendor-arch     \
              --with-cplusplus-extensions \
              --without-java-extensions   \
              --without-python-extensions
}

package() {
  cd "$srcdir/$pkgname-$pkgname-${pkgver//./-}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
