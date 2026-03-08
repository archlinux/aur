# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-pyroomacoustics
_pyname=pyroomacoustics
pkgver=0.8.5
pkgrel=1
pkgdesc='Package for audio signal processing for indoor applications and beamforming algorithms'
arch=('x86_64')
url="https://github.com/LCAV/pyroomacoustics"
license=('MIT')
depends=('python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'cython' 'pybind11' 'eigen')
optdepends=('libsamplerate: for resampling signals'
    'python-matplotlib: to create graphs and plots'
    'python-sounddevice: to play sound samples')
source=(${_pyname}-${pkgver}.tar.gz::"https://github.com/LCAV/pyroomacoustics/archive/v${pkgver}.tar.gz")
sha256sums=('d35ce59d87ce005fd6d76d071041ab4d1cb5906af2777e710fb77b52bebb9a9b')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build_ext --inplace --include-dirs="/usr/include/eigen3"
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -m0644 -D "$srcdir/$_pyname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod -R a+r "$pkgdir/usr"
}
