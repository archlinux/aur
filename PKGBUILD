# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur

pkgname=python-ratelimiter
# To build and install the python 2 package as well, use the next line
# instead of the above one.
# pkgname=('python-ratelimiter' 'python2-ratelimiter')

_libname=${pkgname/python-/}
pkgver=1.2.0
pkgrel=1
pkgdesc='Simple Python module providing rate limiting'
arch=('any')
url='https://github.com/RazerM/ratelimiter'
license=('Apache')

source=("https://pypi.python.org/packages/29/92/20d7b661892a19680887fdd2c410a4e3bd51c90a1940dd406e46072ceb94/ratelimiter-1.2.0.tar.gz")
md5sums=('d5b1005e39da11767d2f74b9fc1b666c')

build() {
  cd "$srcdir/$_libname-$pkgver"

  rm -rf ../buildpy3; mkdir ../buildpy3
  python setup.py build -b ../buildpy3

  ## python 2 build
  if [ ${#pkgname[@]} -eq 2 ]; then
    rm -rf ../buildpy2; mkdir ../buildpy2
    python2 setup.py build -b ../buildpy2
  fi
}

package_python-ratelimiter() {
  cd "$srcdir/$_libname-$pkgver"
  rm -rf build; ln -s ../buildpy3 build
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

package_python2-ratelimiter() {
  cd "$srcdir/$_libname-$pkgver"
  rm -rf build; ln -s ../buildpy2 build
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
