# Maintainer: siphr <archlinux@techtum.dev>

pkgname=pyfrx
pkgver=0.0.7
pkgrel=1
pkgdesc="Forex Rates and Conversions."
depends=(python python-beautifulsoup4)
arch=(any)
source=("https://github.com/siphr/pyfrx/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-pyfrx-220105.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m pyfrx.pyfrx "$@"' > _pyfrx

}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    cp _pyfrx "$pkgdir/usr/bin/pyfrx"
    chmod +x $pkgdir/usr/bin/pyfrx

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up pyfrx.'
}
md5sums=('6600c2b627aff4e476d4505edb27316f')
