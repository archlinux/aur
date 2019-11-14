# Maintainer: getzze <getzze@gmail.com>

pkgname=deluge-labelplus
pkgver=0.3.2.4
pkgrel=2
pkgdesc="LabelPlus is a plugin for Deluge for labeling torrent, with much more functionalities that the builtin Labels."
arch=('any')
## Set to fork until included upstream
url="https://github.com/bdutro/deluge-labelplus"
#url="https://github.com/ratanakvlun/deluge-labelplus"
license=(GPL3)
depends=('deluge')
makedepends=('python-setuptools')
source=($url/archive/v$pkgver.tar.gz)
sha256sums=('1b100872c14c2507bc9e58a1d13e2b8e47cfaf9a6bf4688a665cc1b4acd775fc')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py bdist_egg
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"/dist
    local _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    install -Dm644 "LabelPlus-$pkgver-py${_pyver}.egg" "${pkgdir}/usr/lib/python${_pyver}/site-packages/deluge/plugins/LabelPlus-$pkgver-py${_pyver}.egg"
}

