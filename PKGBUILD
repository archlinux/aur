# Maintainer: siphr <archlinux@techtum.dev>

pkgname=rwp
pkgver=0.0.1
pkgrel=1
pkgdesc="Random Pakistani languages words/phrases generator."
depends=(python)
arch=(any)
source=("https://github.com/siphr/rwp/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-rwp-220314.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/py/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m rwp.rwp "$@"' > _rwp
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/py/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mv _rwp "$pkgdir/usr/bin/rwp"
    chmod +x $pkgdir/usr/bin/rwp

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up rwp.'
}

md5sums=('9d9707a5d2ce529c6db4f2f7ac38e666')
