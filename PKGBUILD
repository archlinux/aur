# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Liam Timms <timms5000 @ g mail dot com>

pkgname="python-hdbscan"
_name=${pkgname#python-}
pkgdesc="Hierarchical Density-Based Spatial Clustering of Applications with Noise"
url="http://github.com/scikit-learn-contrib/hdbscan"

pkgver=0.8.42
pkgrel=1

arch=("x86_64")
license=("BSD-3-Clause")

makedepends=(
    "python-setuptools"
    "cython"
)
depends=(
    "python"
    "python-numpy"
    "python-scipy"
    "python-scikit-learn"
    "python-joblib"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("24ec72bbe8b2dd092503df42d0afd9dd9e03d621ac01de26665916fd0cb28156489b11bed56cc5b3895a9d5e00ac4a2d6a0b0e70149b33a6283b48a632c5b347")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
