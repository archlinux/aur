# Maintainer: Steffen Schneider <stes@hey.com>
pkgname=python-cebra
_pkgname=cebra
pkgver=0.4.0
pkgrel=1
pkgdesc="Consistent Embeddings of high-dimensional Recordings using Auxiliary variables"
url="https://cebra.ai"
depends=(
    python-joblib
    python-scikit-learn
    python-scipy
    python-pytorch
    python-tqdm
    python-joblib
    python-scipy
)
makedepends=(
    python-pytest-benchmark
)
optdepends=(
    python-werkzeug
    python-seaborn
    python-matplotlib
    python-h5py
)
license=('custom')
arch=('any')

source=("https://files.pythonhosted.org/packages/68/9c/4cb1f6e03bf31e955ec3073f9900020af9c6dfe2bbf9f390dbec9b24f999/${_pkgname}-${pkgver}.tar.gz")
md5sums=('dee8d3ff269855f3bd8a5b1a4c34eb93')

_site_packages=$(python -c 'import sys; print(sys.path[-1])')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
	python3 -m build --wheel
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    pip install --ignore-installed --no-deps --root="${pkgdir}" dist/${_pkgname}-${pkgver}-py2.py3-none-any.whl 
    find ${pkgdir} -iname __pycache__ -exec rm -r {} \; 2>/dev/null || echo
    install -Dm 644 LICENSE.md $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

#check() {
#    PYTHONPATH=${pkgdir}/${_site_packages} \
#      python -m pytest \
#      -c $srcdir/${_pkgname}-${pkgver}/pytest.ini \
#      --ff -m "not requires_dataset" \
#      $srcdir/${_pkgname}-${pkgver}/tests
#}
