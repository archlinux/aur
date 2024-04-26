# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-pyroomacoustics
_pyname=pyroomacoustics
pkgver=0.7.3
pkgrel=1
pkgdesc='Package for audio signal processing for indoor applications and beamforming algorithms'
arch=('x86_64')
url="https://github.com/LCAV/pyroomacoustics"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'cython' 'pybind11')
makedepends=('python-setuptools')
optdepends=('libsamplerate: for resampling signals'
    'python-matplotlib: to create graphs and plots'
    'python-sounddevice: to play sound samples')
provides=('python-pyroomacoustics')
source=(${_pyname}-${pkgver}.tar.gz::"https://github.com/LCAV/pyroomacoustics/archive/v${pkgver}.tar.gz")
sha256sums=('403cf2cbd7ed48d189703b0ee92ad0ef35ce5911406d56a25491069c6eedf0d9')

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
