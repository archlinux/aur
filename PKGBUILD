# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: snafu <regflx@web.de>
pkgname=genders
pkgver=1.22
pkgrel=2
pkgdesc="Static cluster configuration database used for cluster configuration management."
arch=('x86_64' 'i686')
url='https://computing.llnl.gov/linux/genders.html'
license=('GPL')
source=("https://github.com/chaos/${pkgname}/releases/download/${pkgname}-1-22-1/${pkgname}-${pkgver}.tar.gz"
        '624078.patch')
sha256sums=('0ff292825a29201106239c4d47d9ce4c6bda3f51c78c0463eb2634ecc337b774'
            '7bd0e8bbf2e29ef00ee2387a1dd964cda841bc8995db85cf97b73c4dd766e699')

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
