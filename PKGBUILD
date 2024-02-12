pkgname=omniorbpy
pkgver=4.3.2
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=(x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL-2.0-or-later')
depends=('omniorb' 'python')
provides=('python-omniorbpy')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
sha256sums=('cb5717d412a101baf430f598cac7d69231884dae4372d8e2adf3ddeebc5f7ebb')
 
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

