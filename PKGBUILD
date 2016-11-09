# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=cysignals
pkgname=python-$_pyname
pkgver=1.3.2
pkgrel=1
pkgdesc='Handle interrupts (and other signals and errors) in Cython code'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('cython')
license=('LGPL3')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.bz2")
sha256sums=('82418186d6cd1ca6ec16f6d5dab5487fc57ddea1356cd7d0228e8862635ca0d1')

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
