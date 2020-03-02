# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
pkgname=walt-node
pkgver=4
pkgrel=1
pkgdesc="WalT optional software embedded in images"
arch=(any)
url="https://walt-project.liglab.fr"
license=('BSD')
depends=(walt-common)
source=("https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('0aacf06d7a531b222f78f1cd3295a41d5d5601eaf056831fd12cd1495edfc894'
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
