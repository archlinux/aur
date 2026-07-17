# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-dynesty
_name=${pkgname#python-}
pkgver=3.1.0
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
sha256sums=('851717431f04f749bca45e86704c28fecf9f3b10f85a2a69820b26e42cefab68')

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

