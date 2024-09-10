# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-pyroomacoustics
_pyname=pyroomacoustics
pkgver=0.7.7
pkgrel=1
pkgdesc='Package for audio signal processing for indoor applications and beamforming algorithms'
arch=('x86_64')
url="https://github.com/LCAV/pyroomacoustics"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'cython' 'pybind11' 'eigen')
makedepends=('python-setuptools')
optdepends=('libsamplerate: for resampling signals'
    'python-matplotlib: to create graphs and plots'
    'python-sounddevice: to play sound samples')
provides=('python-pyroomacoustics')
source=(${_pyname}-${pkgver}.tar.gz::"https://github.com/LCAV/pyroomacoustics/archive/v${pkgver}.tar.gz")
sha256sums=('b59c66802820567a71bb0abfa41a4c89f8858811ffd6cf887af01e029f9f57ad')

build() {
	cd "$srcdir/$_pyname-$pkgver"
	python setup.py build_ext --inplace --include-dirs="/usr/include/eigen3"
	python setup.py build
}

package() {
	cd "$srcdir/$_pyname-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"

	cd "$pkgdir"
	install -m0644 -D "$srcdir/$_pyname-$pkgver"/LICENSE usr/share/licenses/$pkgname/LICENSE
	chmod -R a+r usr
}
