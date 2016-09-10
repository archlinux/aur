# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
_pkgname=alsa-lib
pkgname="${_pkgname}"-noassertion
pkgver=1.1.2
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support, built without assertions"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org"
depends=('glibc')
optdepends=('python2: for python smixer plugin')
makedepends=('python2')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
license=('GPL')
source=(ftp://ftp.alsa-project.org/pub/lib/${_pkgname}-$pkgver.tar.bz2)
sha1sums=('574a0ebd4d218c81f73a0abae79f0e3cc9a6e402')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  ./configure --prefix=/usr --without-debug --with-pythonlibs="-lpthread -lm -ldl -lpython2.7" --with-pythonincludes=-I/usr/include/python2.7
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
