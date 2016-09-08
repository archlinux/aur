# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgbase=python-ggplot
pkgname=(python-ggplot python2-ggplot)
_libname=${pkgbase/python-/}
pkgver=0.11.2
pkgrel=1
pkgdesc='ggplot for python'
arch=('any')
url='https://github.com/yhat/ggplot/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/8b/c1/9b0ed2526effdbd7b2da5a74671592f936d1ebc9a97e11a566c3fcb2eb1c/${_libname}-${pkgver}.tar.gz")


prepare() {
    cd "$srcdir/ggplot-$pkgver"
    python setup.py build

    cd "$srcdir"
    cp -a ggplot-$pkgver{,-py2}
    find ggplot-$pkgver-py2 -name \*.py -exec sed -r 's|^#!(.*)python$|#!\1python2|' -i {} +
}

build() {
    cd "$srcdir"/ggplot-$pkgver
    python setup.py build

    cd "$srcdir"/ggplot-$pkgver-py2
    python2 setup.py build
}

package_python-ggplot() {
    depends=('python-matplotlib' 'python-statsmodels' 'python-brewer2mpl')
    cd "$srcdir/ggplot-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-ggplot() {
    depends=('python-matplotlib' 'python-statsmodels' 'python-brewer2mpl')
    cd "$srcdir/ggplot-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('b01df3498865281730d137455df53fbd7b8c313dbdcc2a7275598f1f9df8dd08')
