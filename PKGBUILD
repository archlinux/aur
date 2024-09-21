# Maintainer: getzze <getzze@gmail.com>

pkgname=deluge-labelplus
pkgver=0.3.2.5
pkgrel=2
pkgdesc="LabelPlus is a plugin for Deluge for labeling torrent, with much more functionalities that the builtin Labels."
arch=('any')
## Set to fork until included upstream
url="https://github.com/laur89/deluge-labelplus"
#url="https://github.com/bdutro/deluge-labelplus"
#url="https://github.com/ratanakvlun/deluge-labelplus"
license=(GPL3)
depends=('deluge')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('63c22bb90a15ffe779378ffb6e73280fc88a26c6b9a1515013d652a58cf5dd42')


build() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py bdist_egg
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"/dist
    local _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    install -Dm644 "LabelPlus-$pkgver.egg" "${pkgdir}/usr/lib/python${_pyver}/site-packages/deluge/plugins/LabelPlus-$pkgver-py${_pyver}.egg"
}
