# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>
_pkgname=line_profiler
pkgbase=python-line_profiler
pkgname=(python{,2}-line_profiler)
pkgver=2.0
pkgrel=1
pkgdesc="line-by-line profiler for python"
arch=('i686' 'x86_64')
url="https://github.com/rkern/line_profiler"
license=('BSD')
makedepends=('python' 'python2' 'cython' 'cython2')
source=('https://pypi.python.org/packages/65/48/61da8ca03e197bb57800c8839f403f2fb7bdf1cfe87fa62e0b35b683273c/line_profiler-2.0.tar.gz')
md5sums=('fc93c6bcfac3b7cb1912cb28836d7ee6')

prepare() {
  cd "$srcdir"
  cp -r "$_pkgname-$pkgver"{,-py2}
}

build() {
  msg "building Python2..."
  cd "$srcdir/$_pkgname-$pkgver-py2"
  LANG=en_US.UTF-8 python2 setup.py build

  msg "building Python3..."
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py build
}

package_python2-line_profiler() {
  depends=('python2')
  cd "$srcdir/$_pkgname-$pkgver-py2"
  LANG=en_US.UTF-8 python2 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

package_python-line_profiler() {
  depends=('python')
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
