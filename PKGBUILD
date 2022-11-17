# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=python38-cython
pkgver=3.0.0a11.r157.g1b028d34d
pkgrel=1
pkgdesc="C-Extensions for Python 3.8"
arch=('i686' 'x86_64')
url="https://cython.org/"
license=('apache')
#depends=('python38' 'python38-setuptools')
depends=('python38')
makedepends=('git')
provides=('python38-cython')
conflicts=('python38-cython')
source=("git+https://github.com/cython/cython.git")
sha256sums=('SKIP')


pkgver() {
  cd "cython"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cython"

  python3.8 "setup.py" build
}

package() {
  cd "cython"

  python3.8 "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"

  for f in cygdb cython cythonize; do
    mv "$pkgdir/usr/bin"/$f "$pkgdir/usr/bin"/${f}3
    ln -s ${f}3 "$pkgdir/usr/bin"/$f
  done
}
