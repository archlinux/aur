# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-vmaf
pkgver=3.0.0
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (python implementation)'
arch=('x86_64')
url='https://github.com/netflix/vmaf/'
license=('BSD')
depends=(
    # official repositories:
        'libsvm' 'python' 'python-dill' 'python-h5py' 'python-matplotlib' 'python-numpy'
        'python-pandas' 'python-pillow' 'python-scikit-learn' 'python-scipy' 'python-slugify'
    # AUR:
        'python-pywavelets' 'python-scikit-image' 'python-sureal'
)
optdepends=('python-tensorflow: for neural network support in model traning and testing')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/vmaf-${pkgver}.tar.gz")
sha256sums=('7178c4833639e6b989ecae73131d02f70735fdb3fc2c7d84bc36c9c3461d93b1')

build() {
    cd "vmaf-${pkgver}/python"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "vmaf-${pkgver}/python/dist"/*.whl
    install -D -m644 "vmaf-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
