# Maintainer: getzze <getzze@gmail.com>

pkgname=deluge-labelplus
pkgver=0.3.2.4
pkgrel=3
pkgdesc="LabelPlus is a plugin for Deluge for labeling torrent, with much more functionalities that the builtin Labels."
arch=('any')
## Set to fork until included upstream
url="https://github.com/laur89/deluge-labelplus"
#url="https://github.com/bdutro/deluge-labelplus"
#url="https://github.com/ratanakvlun/deluge-labelplus"
license=(GPL3)
depends=('deluge')
makedepends=('python-setuptools')
#source=($url/archive/v$pkgver.tar.gz)
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        bug-gtk.patch
        bug-egg.patch)
sha256sums=('8122daab527c02987ed602b9687fd46b306f60f9e0f044a2ed2bb1a342178e07'
            '9d3700d54c579dc20f766dcc6a2702bbfc2c98992a216a16053c074bc38f6d0e'
            'b5fd58c6ba2ca0765094763695d919fe1bf861e361d29d0ba8a3ec7773a47069')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"
    patch -p0 -i "${srcdir}/bug-egg.patch"
    patch -p0 -i "${srcdir}/bug-gtk.patch"
}

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py bdist_egg
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"/dist
    local _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    install -Dm644 "LabelPlus-$pkgver-py${_pyver}.egg" "${pkgdir}/usr/lib/python${_pyver}/site-packages/deluge/plugins/LabelPlus-$pkgver-py${_pyver}.egg"
}
