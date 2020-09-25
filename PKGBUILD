# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=python-vegasflow
_name=vegasflow
pkgver=1.2.0
pkgrel=1
pkgdesc='Monte Carlo integration library written in Python and based on the TensorFlow framework'
arch=('any')
url="https://vegasflow.readthedocs.io/"
license=('GPL3')
depends=("python>=3.6"
         "python-tensorflow"
         "python-joblib"
         "python-numpy")
optdepends=("python-cffi: interfacing vegasflow with C code"
            "python-tensorflow-cuda: GPU support"
            "python-pdfflow: PDF interpolation with TensorFlow"
            )
BUILDENV+=('!check') # Don't check by default!
checkdepends=("python-pytest")
provides=("vegasflow")
changelog=
source=("https://github.com/N3PDF/vegasflow/archive/v${pkgver}.tar.gz")
md5sums=("5c042f6f8ed721aa650e4ab0f5dc094d")

prepare() {
	cd "$_name-$pkgver"
}

check() {
	cd "$_name-$pkgver"
    pytest
}

build() {
	cd "$_name-$pkgver"
    python setup.py build 
}

package() {
	cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=2 --skip-build
}
