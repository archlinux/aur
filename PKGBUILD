# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
pkgname=nanovna-saver
pkgver=0.5.4
pkgrel=2
pkgdesc="PC control for the NanoVNA."
arch=(any)
url="https://github.com/mihtjel/nanovna-saver"
license=('GPL3')
depends=(python-pyqt5 python-scipy python-numpy python-pyserial qt5-base)
makedepends=(python-setuptools)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mihtjel/nanovna-saver/archive/v$pkgver.tar.gz"
  "remove-changelog.md-from-setup.py.patch"
)
sha256sums=('07de0fe28434b8e11d28481f4c006a6b3e3991b02b2a4ab1b6dd3607de6fa4a9'
            'ce749ffcc2bc5e9bc751b466e81a2999e46c83289dfac2a60ca2f23936a5f805')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "${srcdir}/remove-changelog.md-from-setup.py.patch"
}

build() {
    cd "$pkgname-$pkgver"
    python ./setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python ./setup.py install --prefix=/usr --root="$pkgdir"
}
