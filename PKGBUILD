pkgname=omniorbpy
pkgver=4.3.1
pkgrel=2
pkgdesc="A CORBA object request broker for C++ and Python."
arch=(x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb' 'python')
provides=('python-omniorbpy')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
sha256sums=('9da34af0a0230ea0de793be73ee66dc8a87e732fec80437ea91222e272d01be2')
 
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

