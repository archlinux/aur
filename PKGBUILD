# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Liam Timms <timms5000 @ g mail dot com>

pkgname="python-hdbscan"
_name=${pkgname#python-}
pkgdesc="Hierarchical Density-Based Spatial Clustering of Applications with Noise"
url="http://github.com/scikit-learn-contrib/hdbscan"

pkgver=0.8.43
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
b2sums=("65499ad2adf1c6eea2a58aa65b9fad696343b407f60244bd5ab74b9145627392cdcd46d812684dd32b1fa25baed1d7feaaef303bde41fbbe35d360bdb3e4970b")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
