# Maintainer: siphr <archlinux@techtum.dev>

pkgname=spol
pkgver=0.0.1
pkgrel=1
pkgdesc="Pakistan Sindh Police."
depends=(python python-beautifulsoup4)
arch=(any)

source=("https://github.com/siphr/spol/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-spol-220121.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m spol.spol "$@"' > _spol
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mv _spol "$pkgdir/usr/bin/spol"
    chmod +x $pkgdir/usr/bin/spol

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up spol.'
}
md5sums=('SKIP')
