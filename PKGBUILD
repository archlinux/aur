pkgname=omniorbpy
pkgver=4.3.0
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=(x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb' 'python')
provides=('python-omniorbpy')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
sha256sums=('fffcfdfc34fd6e2fcc45d803d7d5db5bd4d188a747ff9f82b3684a753e001b4d')
 
build() {
  cd "$srcdir/omniORBpy-$pkgver"
  ./configure PYTHON=/usr/bin/python --prefix=/usr
  make
}

package() {
  cd "$srcdir/omniORBpy-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove conflicting files
  rm -r "$pkgdir"/usr/lib/*/site-packages/omniidl_be/
}

