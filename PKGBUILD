# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
pkgname=walt-common
pkgver=4
pkgrel=1
pkgdesc="WalT common python modules"
arch=(any)
url="https://walt-project.liglab.fr"
license=('BSD')
depends=(python2-plumbum)
source=("https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('3a415b2845cb142148a551b3f65c30a9b49a6a58c4ae2c11c3d853d174ac3d54'
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
}
