# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-pyroomacoustics-git
_pyname=pyroomacoustics
pkgver=v0.8.3.r0.g8f64460
pkgrel=1
pkgdesc='Package for audio signal processing for indoor applications and beamforming algorithms'
arch=('x86_64')
url="https://github.com/LCAV/pyroomacoustics"
license=('MIT')
depends=('python-numpy' 'python-scipy')
makedepends=('git' 'python-setuptools' 'cython' 'pybind11' 'eigen')
optdepends=('libsamplerate: for resampling signals'
    'python-matplotlib: to create graphs and plots'
    'python-sounddevice: to play sound samples')
provides=('python-pyroomacoustics=${pkgver}')
conflicts=('python-pyroomacoustics')
source=("${_pyname}::git+https://github.com/LCAV/pyroomacoustics.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pyname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pyname"
  #cd $_pyname
  python setup.py build_ext --inplace --include-dirs="/usr/include/eigen3"
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -m0644 -D "$srcdir/$_pyname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod -R a+r "$pkgdir/usr"
}
