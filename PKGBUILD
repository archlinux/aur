# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-dynesty
_name=${pkgname#python-}
pkgver=3.2.0
pkgrel=1
pkgdesc="A dynamic nested sampling package for computing Bayesian posteriors and evidences."
arch=(any)
url="https://github.com/joshspeagle/dynesty"
license=('MIT')
depends=(
    python-numpy
    python-scipy
    python-matplotlib
)
optdepends=(
    "python-h5py: save likelihood evaluation history"
    "python-tqdm: allow for a nice progress bar"
)
makedepends=(python-build python-installer python-wheel)
conflicts=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('177ca0eade6d8ffff2d5ab2cca3d710d1045385840f3bdc402f748e53d72098a')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}

