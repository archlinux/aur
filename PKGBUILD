# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-fastkde
_name=${pkgname#python-}
pkgver=1.0.26
pkgrel=2
pkgdesc="Fast kernel density estimation"
arch=(any)
url="https://github.com/LBL-EESA/fastkde"
license=(LBNL)
groups=()
depends=(python-numpy python-scipy cython)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5dbfd7552040e669fc20ada349f5e9bf023a380851cbe10d30146de845a63693')
build() {
    cd "$srcdir/$_name-$pkgver"
    sed -i 's/"oldest-supported-numpy.*"/"numpy"/' pyproject.toml
    #sed -i 's:nspread/2:"nspread//2:' fastkde/nufft.pyx
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

