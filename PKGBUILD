# Maintainer: Zeph <zeph33@gmail.com>

pkgname=python2-pysvn
pkgver=1.7.10
pkgrel=1
pkgdesc="Python2 SVN Extension."
arch=('any')
url="http://pysvn.tigris.org"
license=('APACHE')

depends=('python2>=2.7' 'subversion' 'apr' 'expat' 'neon' 'openssl')
conflicts=('pysvn<=1.7.4-3' 'pysvn-py2')
replaces=('pysvn-py2')
provides=('pysvn-py2')
source=("http://pysvn.barrys-emacs.org/source_kits/pysvn-$pkgver.tar.gz")
md5sums=('bf7527591d5086bd6d01cdc0d09a076e')

build() {
  cd $srcdir/pysvn-$pkgver/Source
  python2 setup.py configure || return 1
  make || return 1
}

package() {
  _pyver=`python2 -V 2>&1|sed -e 's/.* 2\.\([0-9]\).*/\1/'`
  cd $srcdir/pysvn-$pkgver/Source
  install -D -m644 pysvn/__init__.py $pkgdir/usr/lib/python2.${_pyver}/site-packages/pysvn/__init__.py
  install -D -m755 pysvn/_pysvn_2_${_pyver}.so $pkgdir/usr/lib/python2.${_pyver}/site-packages/pysvn/_pysvn_2_${_pyver}.so
}
