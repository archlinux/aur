# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>

pkgname=python-vispy
pkgver=0.6.5
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='http://vispy.org'
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools' 'cython')
optdepends=('pyside2: a possible backend'
            'python-pyqt5: a possible backend')
_pkgname=vispy
_js_commit=a4e25bc4eb1fcabbcb945a502eace77d768deaae
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vispy/vispy/archive/v$pkgver.tar.gz"
        "vispy.js.tar.gz"::"https://github.com/vispy/vispy.js/archive/${_js_commit}.tar.gz")
sha256sums=('00c0624ad897f53b2a4f87f7f057c27390051850a943ea7bf127558cc7b359f2'
            '1d1cddff763ab40c460968bf300cc389bb9cf844a232494d9eabe23ff401e6a8')

prepare() {
    rm -r "$srcdir/${_pkgname}-${pkgver}/js"
    cp -r "$srcdir/vispy.js-${_js_commit}/." "$srcdir/${_pkgname}-${pkgver}/js"
}

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
