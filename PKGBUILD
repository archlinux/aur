# Maintainer: gonsolo@gmail.com
pkgname=python-libparse
pkgver=0.3.1
pkgrel=1
pkgdesc="Python library for parsing Liberty files"
arch=('x86_64')
url="https://github.com/TinyTapeout/libparse-python"
license=('Apache')
depends=('python' 'yosys')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'swig' 'gcc' 'make')
source=("git+https://github.com/TinyTapeout/libparse-python.git#commit=cec8b6d")
sha256sums=('SKIP')

prepare() {
  cd libparse-python
  git submodule update --init --recursive
}

build() {
  cd libparse-python
  python -m build --wheel --no-isolation
}

package() {
  cd libparse-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Only install LICENSE if it exists
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || :
}
