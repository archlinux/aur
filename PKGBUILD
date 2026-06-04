# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Liam Timms <timms5000 @ g mail dot com>

pkgname="python-hdbscan"
_name=${pkgname#python-}
pkgdesc="Hierarchical Density-Based Spatial Clustering of Applications with Noise"
url="http://github.com/scikit-learn-contrib/hdbscan"

pkgver=0.8.44
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
b2sums=("8d28c671aea8b62631b905bad315bcbcd9c616202d0486df2d3ed3c2f9f425b16c7d237eaefef50b58a1bb8f250d1928d14533a91ffecd710c65d2b02066806a")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
