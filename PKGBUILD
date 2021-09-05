# Maintainer: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5-git
pkgver=21.1.0.r2.g85adedd
pkgrel=1
pkgdesc='Python binding to libpoppler-qt5.'
arch=('any')
url='https://github.com/frescobaldi/python-poppler-qt5'
license=('LGPL')
depends=('python' 'python-pyqt5' 'poppler-qt5')
makedepends=('git' 'sip4')
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
source=(${pkgname}::'git+https://github.com/wbsoft/python-poppler-qt5.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"
    python setup.py build_ext \
        --pyqt-sip-dir=$(python -c "import PyQt5, os; print(os.path.dirname(PyQt5.__file__))")/bindings
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
