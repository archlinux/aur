# Maintainer: Michele Mocciola <mickele>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=omninotify-omniorb416
pkgver=2.1
pkgrel=1
pkgdesc="A multi-threaded implementation of the CORBA Notification Service"
arch=('i686' 'x86_64')
url="http://omninotify.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('omniorb416')
provides=("omninotify=${pkgver}")
conflicts=('omninotify')
makedepends=('patch' 'pkgconfig' 'coreutils')
source=(http://downloads.sourceforge.net/omninotify/omniNotify-$pkgver.tar.gz
        omniNotify-2.1-lib64.patch
        omniNotify-2.1.patch)

prepare() {
  cd "$srcdir"/omniNotify
  patch -Np1 < "$srcdir"/omniNotify-2.1-lib64.patch
  if test "$CARCH" == x86_64; then
    patch -Np1 < "$srcdir"/omniNotify-2.1.patch
  fi
}

build() {
  cd "$srcdir"/omniNotify
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/omniNotify
  make DESTDIR="$pkgdir" install
  chmod 755 "$pkgdir"/usr "$pkgdir"/usr/bin "$pkgdir"/usr/lib "$pkgdir"/usr/include
}
md5sums=('6f5655e4f1cfff4d4dc21688ca4c9e8b'
         '9c3e39587f6bd865e89484e8adf99514'
         '9ed026246e49c0b9f1473348ba55ee5d')
