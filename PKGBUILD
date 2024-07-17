# Maintainer: pryme-svg <edoc.www@gmail.com>
pkgname=python-becquerel-git
_name=becquerel
pkgver=v0.6.0.r221.g71be85a
pkgrel=1
pkgdesc='A Python package for analyzing nuclear spectroscopic measurements.'
arch=('any')
url="https://github.com/lbl-anp/becquerel"
license=(BSD-3-Clause)
makedepends=(python-setuptools)
depends=(python-asteval python-beautifulsoup4 python-black python-future python-h5py python-html5lib python-iminuit python-llvmlite python-lmfit python-lxml python-matplotlib python-numba python-numdifftools python-numpy python-pandas python-dateutil python-requests python-scipy python-setuptools python-uncertainties)
checkdepends=(python-pytest-runner)
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
	python setup.py build
}

package() {
    cd $_name
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check(){
    cd $_name
	python setup.py pytest
}

