# Maintainer: Wil Thomason <wbthomason at cs dot cornell dot edu>

pkgname='python-scalene-git'
pkgver=r461.822c83d
pkgrel=1
pkgdesc='Scalene is a high-performance, high-precision CPU and memory profiler for Python'
arch=('any')
url='https://github.com/emeryberger/scalene'
license=('Apache-2.0')
depends=('python>=3.6' 'python-numpy')
makedepends=('python-setuptools' 'make' 'clang' 'git')
source=("${pkgname}::git+https://github.com/emeryberger/scalene.git")
sha256sums=('SKIP')
provides=('python-scalene')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  git clone https://github.com/emeryberger/Heap-Layers
  make
}

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
