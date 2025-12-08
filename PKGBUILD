# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-cpu
pkgver=1.4.0
pkgrel=6
pkgdesc="Python bindings for whisper.cpp (CPU-only variant)"
arch=('x86_64')
url="https://github.com/Absadiki/pywhispercpp"
license=('MIT')
options=('!strip')
depends=(
  'python'
  'python-numpy'
  'python-requests'
  'python-tqdm'
  'python-platformdirs'
)
makedepends=(
  'cmake'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'git'
)
optdepends=(
  'python-sounddevice: run pywhispercpp examples that capture audio'
  'python-webrtcvad: run VAD-based examples'
  'python-pyqt5: run GUI example'
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

