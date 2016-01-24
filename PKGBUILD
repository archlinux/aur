# Maintainer: Jason Khanlar <jason.khanlar@gmail.com>
pkgname=wofftools
pkgver=0.1beta
pkgrel=1
pkgdesc="A library for working with WOFF files."
arch=('any')
url="https://github.com/typesupply/woffTools"
license=('MIT')
depends=('python2-fonttools' 'python2-numpy')
source=(
    "https://github.com/typesupply/woffTools/archive/master.zip"
)
md5sums=('3c9358f147eff195449736c045a11d8b')
prepare() {
    sed -i 's|^#!/usr/bin/env python|#!/usr/bin/env python2|' woffTools-master/setup.py
}
build() {
    cd "woffTools-master"
    python2 setup.py build
}
package() {
    cd "woffTools-master"
    install -Dm755 "woff-all" "$pkgdir/usr/bin/woff-all"
    install -Dm755 "woff-css" "$pkgdir/usr/bin/woff-css"
    install -Dm755 "woff-info" "$pkgdir/usr/bin/woff-info"
    install -Dm755 "woff-proof" "$pkgdir/usr/bin/woff-proof"
    install -Dm755 "woff-validate" "$pkgdir/usr/bin/woff-validate"
    sed -i 's|^#! \?/usr/bin/env python|#!/usr/bin/env python2|' $pkgdir/usr/bin/woff-*
}
