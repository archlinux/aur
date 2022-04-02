# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>
# Contributor: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=1.0.0
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/shoyer/h5netcdf"
license=('BSD')
depends=('python-h5py')
makedepends=(
  'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
  'python-setuptools-scm-git-archive' 'python-wheel'
)
checkdepends=('python-netcdf4' 'python-pytest')

_pypi=h5netcdf
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '4bf07ac545e6e4ee372a8505ffcee5c83f2db8b9a5c4a510b9336d92c3d50fa6'
)

build() {
    cd "$_pypi-${pkgver}"
    python -m build --wheel --no-isolation

}

check() {
    cd "$_pypi-${pkgver}"
    PYTHONPATH="./build/lib" pytest -v --disable-warnings
}

package() {
    cd "$_pypi-${pkgver}"
    python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
