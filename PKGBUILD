# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
_pkgname=alsa-lib
pkgname="${_pkgname}"-noassertion
pkgver=1.1.3
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
sha1sums=('8ef0b9725296ac8f24e06f20196f5b2b62ab27a9')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  ./configure --prefix=/usr --without-debug --with-pythonlibs="-lpthread -lm -ldl -lpython2.7" --with-pythonincludes=-I/usr/include/python2.7
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
