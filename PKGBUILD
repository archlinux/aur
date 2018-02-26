# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>
_pkgname=line_profiler
pkgbase=python-line_profiler
pkgname=(python{,2}-line_profiler)
pkgver=2.1
pkgrel=2
pkgdesc="line-by-line profiler for python"
arch=('i686' 'x86_64')
url="https://github.com/rkern/line_profiler"
license=('BSD')
makedepends=('python' 'python2' 'cython' 'cython2' 'ipython' 'ipython2')
source=("https://github.com/rkern/line_profiler/archive/${pkgver}.tar.gz")
md5sums=('bd1cb2ba21af02339beab7ddc3a69c66')

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
  depends=('python2' 'ipython2')
  cd "$srcdir/$_pkgname-$pkgver-py2"
  LANG=en_US.UTF-8 python2 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

package_python-line_profiler() {
  depends=('python' 'ipython')
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
