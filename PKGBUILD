# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-dynesty
_name=${pkgname#python-}
pkgver=3.0.0
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
    "python-h5py: allow for a nice progress bar"
    "python-tqdm: save likelihood evaluation history"
)
makedepends=(python-build python-installer python-wheel)
conflicts=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("806c83b21904cf7df73c2478a9e0e8a2b7d811cd0d613109f3f810a7111d12b0")

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

