# Maintainer: siphr <archlinux@techtum.dev>

_pypkgname=rwpk
pkgname=rwp
pkgver=0.0.2
pkgrel=1
pkgdesc="Random Pakistani languages words/phrases generator."
depends=(python)
arch=(any)
source=("https://github.com/siphr/rwpk/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-rwp-220314.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$_pypkgname-$pkgver/py/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m rwpk.rwpk "$@"' > _rwp
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$_pypkgname-$pkgver/py/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mv _rwp "$pkgdir/usr/bin/$pkgname"
    chmod +x $pkgdir/usr/bin/$pkgname

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up rwp.'
}

md5sums=('cd3a065a587dab26ab6e04ad5cf27a85')
