# Maintainer: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
pkgver=1.7.10
pkgrel=1
pkgdesc="Python3 SVN Extension."
url="http://pysvn.tigris.org"
depends=('python>=3.1.3' 'subversion' 'apr' 'expat' 'neon' 'openssl')
conflicts=('pysvn<=1.7.4-3')
arch=('i686' 'x86_64')
license=('APACHE')
source=("http://pysvn.barrys-emacs.org/source_kits/pysvn-$pkgver.tar.gz")
md5sums=('bf7527591d5086bd6d01cdc0d09a076e')

build() {
  cd "$srcdir/pysvn-$pkgver/Source"
  python3 setup.py configure || return 1
  make
}

check() {
  cd "$srcdir/pysvn-$pkgver/Tests"
  make
}

package() {
  _pyver=`python3 -V 2>&1|sed -e 's/.* 3\.\([0-9]\).*/\1/'`
  cd "$srcdir/pysvn-$pkgver/Source"
  install -Ddm755 "$pkgdir/usr/lib/python3.$_pyver/site-packages/pysvn/"
  install -Dm644 pysvn/__init__.py "$pkgdir/usr/lib/python3.$_pyver/site-packages/pysvn/__init__.py"
  install -Dm755 "pysvn/_pysvn_3_$_pyver.so" "$pkgdir/usr/lib/python3.$_pyver/site-packages/pysvn/_pysvn_3_$_pyver.so"
}
# vim: set ts=2 sw=2 et:
