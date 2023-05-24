# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

_name=nbmerge
pkgname=$_name
pkgver=0.0.4
pkgrel=2
pkgdesc="A tool to merge / concatenate Jupyter (IPython) notebooks "
url="https://github.com/jbn/nbmerge"
depends=(
    'jupyter-nbformat'
    'python'
)
makedepends=(
    'python-setuptools'     # namcap expects this to be a runtime dep, but it shouldn't
)
license=('MIT')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('f432797ee685ed495a2daa4dbb76e2b52028d2c3a38142b523bb5cb832df0882')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/nbmerge/LICENSE
}
