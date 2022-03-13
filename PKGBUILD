# Maintainer: siphr <archlinux@techtum.dev>
pkgname=rwu
_pypkgname=urw
pkgver=0.0.7
pkgrel=1
pkgdesc="Random Urdu words/phrases generator."
depends=(python)
arch=(any)
source=("https://github.com/siphr/urw/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-urw-220310.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$_pypkgname-$pkgver/pip/"
    python setup.py build
    echo -e '#!/bin/sh\n\nexec python -m urw.urw "$@"' > rwu
}

package() {
    echo "INSTALLING..."
    #echo $pkgdir/$pypkgname-$pkgver
    cd "$srcdir/$_pypkgname-$pkgver/pip"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir $pkgdir/usr/bin

    cp rwu "$pkgdir/usr/bin/rwu"
    chmod +x "$pkgdir/usr/bin/rwu"

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up rwu.'
}

md5sums=('698e0e112e9013695bd047eea7ac782e')
