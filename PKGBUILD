# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cython-git
pkgver=0.29.7.r371.g1a1087bd6
pkgrel=1
pkgdesc="C-Extensions for Python"
arch=('i686' 'x86_64')
url="https://cython.org/"
license=('apache')
depends=('python-setuptools')
makedepends=('git')
provides=('cython')
conflicts=('cython')
source=("git+https://github.com/cython/cython.git")
sha256sums=('SKIP')


pkgver() {
  cd "cython"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cython"

  python "setup.py" build
}

package() {
  cd "cython"

  python "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"

  for f in cygdb cython cythonize; do
    mv "$pkgdir/usr/bin"/$f "$pkgdir/usr/bin"/${f}3
    ln -s ${f}3 "$pkgdir/usr/bin"/$f
  done
}
