# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=cysignals
pkgname=python-$_pyname
pkgver=1.1.1
pkgrel=1
pkgdesc='Handle interrupts (and other signals and errors) in Cython code'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('cython')
license=('LGPL3')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.bz2")
sha256sums=('70d3e0033c90861cd7e1246958d166d9e44a076683f6a166afe6270fdb7cb680')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  # See https://github.com/sagemath/cysignals/issues/32
  echo '' > $pkgdir/usr/bin/cysignals-CSI
  rm $pkgdir/usr/bin/cysignals-CSI-helper.py
}
