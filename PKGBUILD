# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
pkgname=walt-server
pkgver=4
pkgrel=1
pkgdesc="WalT server components"
arch=(any)
url="https://walt-project.liglab.fr"
license=('BSD')
depends=(walt-common walt-virtual
         python2-snimpy python2-ipaddress python2-requests
         python2-docker python2-sdnotify python2-dateutil)
source=("https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('caf87c1c8596303b517b555ba5a1c16d5441c50f3e483f51a7a908cf9129b5f6'
            '49e4de7e7679bb97dd8bf5363c87da852ef1e00d8a1263d2fe4855d7b47fd401')

prepare() {
    cd "$pkgname-$pkgver"
    # Force python2 in sheebang
    find . -name \*.py | xargs sed -i '1s|^#!/usr/bin/env python$|\02|'
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "$pkgname-$pkgver"
    python2 setup.py install --root "$pkgdir"
    # These files are already provided by walt-common
    rm "${pkgdir}/usr/lib/python2.7/site-packages/walt/__init__.py"*
}
