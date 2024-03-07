# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_name=dipy
pkgname=python-dipy
pkgver=1.8.0
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="https://dipy.org"
license=('BSD')
depends=(
    'python-h5py'
    'python-nibabel'
    'python-numpy'
    'python-packaging'
    'python-scipy'
    'python-tqdm'
)
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
source=(
    "$_name-$pkgver.tar.gz::https://github.com/dipy/dipy/archive/${pkgver}.tar.gz"
    "perm_numpy.patch"
)
sha256sums=('06648d858d1c5f5e69859e4298aed837eee123a61d60c2411b7f76724e54f241'
            'd59365ee1277348504af3c2984da351738b977f91b5d70e86065e74020e73c9f')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    # patch -p1 -i "$srcdir/perm_numpy.patch"
    patch pyproject.toml < "$srcdir/perm_numpy.patch"
}

# package() {
#     cd "$srcdir/$_pkgname-$pkgver"
#     install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#     python setup.py install --optimize=1 --root="$pkgdir"
# }


build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}


