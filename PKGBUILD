# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgbase=python-ggplot
pkgname=(python-ggplot python2-ggplot)
pkgver=0.6.8
pkgrel=1
pkgdesc='ggplot for python'
arch=('any')
url='https://github.com/yhat/ggplot/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/g/ggplot/ggplot-${pkgver}.tar.gz")


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

sha256sums=('6043767ac3e7ba1deb98042561485e34ace8439098432c01c0bb83b49bdfa809')
