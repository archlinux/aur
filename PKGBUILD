# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>

pkgname=python-vispy
pkgver=0.6.4
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='http://vispy.org'
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools' 'cython')
optdepends=('pyside2: a possible backend'
            'python-pyqt5: a possible backend')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vispy/vispy/archive/v$pkgver.tar.gz"
        "vispy.js.tar.gz"::"https://github.com/vispy/vispy.js/archive/df614ccb7d5e75e09bfea4951ce925cfca30a6c9.tar.gz")
sha256sums=('220626729a04afb29054f468c9d216939734c5bde9685cb5403ce652b7eb41b8'
            '665f42f572ef67648966bd21b3970311c1947514cf9d02b1b841404e19ecedf5')

_pkgname=vispy
_js_commit=df614ccb7d5e75e09bfea4951ce925cfca30a6c9

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
