# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=affine
pkgname=python-${_pkgname}
pkgver=2.4.0
pkgrel=1
pkgdesc="Python package for matrices describing affine transformation of the plane"
url='https://github.com/rasterio/affine'
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-flit-core'
            )
depends=('python')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a24d818d6a836c131976d22f8c27b8d3ca32d0af64c1d8d29deb7bafa4da1eea')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/test"
}
