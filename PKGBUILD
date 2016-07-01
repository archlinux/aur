# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=douban.fm
pkgver=0.4.15
pkgrel=1
pkgdesc="a tiny and smart cli player of douban.fm based on Python"
url="https://github.com/taizilongxu/douban.fm"
depends=('python2' 'python2-termcolor' 'python2-requests' 'python2-cookiecheat' 'mplayer' 'python2-pip')
makedepends=('python2-setuptools')
optdepends=('libnotify: for desktop notification')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/40/c6/071ecdee1a40687552016ed3e925d44d6121d07c9e5da9dae3c69de1d2c9/douban.fm-${pkgver}.tar.gz")
md5sums=('f4b52f8dc24b25803e94baf343b847ed')

build() {
    cd "${srcdir}/douban.fm-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/douban.fm-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    echo '#!/usr/bin/env sh' > "${pkgdir}/usr/bin/douban.fm"
    echo 'python2 -c "from doubanfm import douban as db;db.main()" "$@"' > "${pkgdir}/usr/bin/douban.fm"
}
