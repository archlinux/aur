 # Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=tweedledum
pkgname=python-${_pkgname}
pkgver=1.1.1
pkgrel=1
pkgdesc="A library for synthesizing and manipulating quantum circuits"
arch=('x86_64')
url="https://github.com/boschmitt/tweedledum"
license=('MIT')
makedepends=(
    'cmake'
    'ninja'
    'nlohmann-json'
    'python-scikit-build'
    'python-setuptools'
)
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "https://github.com/boschmitt/tweedledum/pull/170.patch"
)
sha256sums=('58d6f7a988b10c31be3faa1faf3e58288ef7e8159584bfa6ded45742f390309f'
            'c1a1d2bf8e7f5416e93c9e9da7d35992b542a0eafef08e504254499d038b3e03')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Fixes https://github.com/boschmitt/tweedledum/issues/169
    patch --forward --strip=1 --input="${srcdir}/170.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
