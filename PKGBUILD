# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_name=pydbus
pkgname="python2-${_name}"
pkgver=0.6.0
pkgrel=4
pkgdesc="pythonic D-Bus library"
arch=(any)
url="https://github.com/LEW21/${_name}"
license=(LGPL)
depends=(python2 python2-gobject)
makedepends=(python2-setuptools)
# checkdepends=(xorg-server-xvfb python2-gobject)
source=("${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dacdf0498a831c8b43a4f3d985d64f99f3093a8aaf4e2ea99981c30fdf1a42da')

build() {
    cd "${_name}-${pkgver}"
    python2 setup.py build
}

# https://github.com/LEW21/pydbus/issues/85
# check() {
#     cd "${_name}-${pkgver}"
#     # ./tests/run.sh
#     # LANG='en_US.UTF-8' xvfb-run python2 setup.py test
# }

package() {
    cd "${_name}-${pkgver}"
    python2 setup.py install --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root="${pkgdir}"

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
}
