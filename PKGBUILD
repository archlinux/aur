# Maintainer: siphr <archlinux@techtum.dev>

_pypkgname=urdu_digit
pkgname=urdu-digit
pkgver=0.0.17
pkgrel=1
pkgdesc="Convert English digits to Urdu ones."
depends=(python python-beautifulsoup4)
arch=(any)
source=("https://github.com/siphr/urdu-digit/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-urdu-digit-211001.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m urdu_digit.urdu_digit "$@"' > urdu-digit 
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/pip"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    cp urdu-digit "$pkgdir/usr/bin/urdu-digit"
    chmod +x $pkgdir/usr/bin/urdu-digit

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up urdu-digit.'
}
md5sums=('a1a1956fa68c89aced0d19784c5ab7f2')
