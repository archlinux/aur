pkgname=omniorbpy
pkgver=4.3.3
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=(x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL-2.0-or-later')
depends=('omniorb' 'python')
provides=('python-omniorbpy')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
sha256sums=('385c14e7ccd8463a68a388f4f2be3edcdd3f25a86b839575326bd2dc00078c22')
 
build() {
  cd "$srcdir/omniORBpy-$pkgver"
  ./configure PYTHON=/usr/bin/python --prefix=/usr
  make
}

package() {
  cd "$srcdir/omniORBpy-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove conflicting files from omniorb package
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__init__.py
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__pycache__/__init__.*
}

