# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>

pkgname=python-vispy
pkgver=0.7.0
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='http://vispy.org'
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools' 'cython' 'npm')
optdepends=('pyside2: a possible backend'
            'python-pyqt5: a possible backend')
_pkgname=vispy
_js_commit=2d8be774552f20add80860b2b7d0bfd600730595
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vispy/vispy/archive/v$pkgver.tar.gz"
        "vispy.js.tar.gz"::"https://github.com/vispy/vispy.js/archive/${_js_commit}.tar.gz")
sha256sums=('9262bda90b5b06dba7ccbc6cb46cb5811b88aff0ccff2674a8b2bb84e89d3a05'
            '2f10454096cb1ebfa14bd76109fa9ec729f3866307eb990bb66dad1012938c4f')

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
