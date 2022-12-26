# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cython-git
pkgver=3.0.0a11.r191.g8fcc9896f
pkgrel=1
pkgdesc="C-Extensions for Python"
arch=('i686' 'x86_64')
url="https://cython.org/"
license=('apache')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("cython=$pkgver")
conflicts=('cython')
source=("git+https://github.com/cython/cython.git")
sha256sums=('SKIP')


pkgver() {
  cd "cython"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cython"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "cython"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  for f in cygdb cython cythonize; do
    mv "$pkgdir/usr/bin"/$f "$pkgdir/usr/bin"/${f}3
    ln -s ${f}3 "$pkgdir/usr/bin"/$f
  done
}
