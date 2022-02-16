# Maintainer: Joshua Haase <hahj87@gmail.com>
# Contributor: Jonas Weber <contact@jonasw.de>
pkgname=gpp
pkgver=2.27
pkgrel=1
pkgdesc="A general-purpose preprocessor with customizable syntax, suitable for a wide range of preprocessing tasks"
arch=('x86_64' 'i686' 'armv7' 'mips64el')
url="http://en.nothingisreal.com/wiki/GPP"
license=('LGPL2.1')
depends=('glibc')
source=(
  "gpp::git+https://github.com/logological/gpp.git#tag=$pkgver"
)
sha256sums=('SKIP')
# you can get the public key from: http://common.nothingisreal.com/w/images/1/13/EFBF4915.txt
validpgpkeys=("28F47A15AB82C216D278DEB92B119C3AEFBF4915")

build() {
  cd "$srcdir/$pkgname"
  aclocal \
  && autoheader \
  && automake --add-missing \
  && autoconf \
  && ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
