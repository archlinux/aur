# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-cpu
pkgver=1.4.0
pkgrel=3
pkgdesc="Python bindings for whisper.cpp (CPU-only variant)"
arch=('x86_64')
url="https://github.com/Absadiki/pywhispercpp"
license=('MIT')
depends=(
  'python'
  'python-numpy'
)
makedepends=(
  'cmake'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'git'
)
provides=('python-pywhispercpp')
conflicts=('python-pywhispercpp' 'python-pywhispercpp-cuda' 'python-pywhispercpp-rocm')
source=("git+https://github.com/Absadiki/pywhispercpp.git#commit=4ab96165f84e8eb579077dfc3d0476fa5606affe")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/pywhispercpp"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/pywhispercpp"
  # CPU-only: no GPU environment variables set
  python -m build --wheel
}

package() {
  cd "$srcdir/pywhispercpp"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

