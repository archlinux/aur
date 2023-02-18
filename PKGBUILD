# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_pkgname=dipy
pkgname=python-dipy
pkgver=1.6.0
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
    "https://github.com/dipy/dipy/archive/${pkgver}.tar.gz"
    "fix_setup.patch"
)
sha256sums=('00849ed54c9973859cfa9e428d14726900db05aa9dc62bd8e4088f7e266c8d38'
            'c6b99523070b78a5c6e2ff855f5b832c89947b2903669496e22f0b8a6ce710db')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -p1 -i "$srcdir/fix_setup.patch"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --optimize=1 --root="$pkgdir"
}
