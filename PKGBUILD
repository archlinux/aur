# Maintainer: siphr <archlinux@techtum.dev>

pkgname=alephs
pkgver=0.5
pkgrel=1
pkgdesc="A List of Pakistan's Emergency Help Services."
depends=(python)
arch=(any)

source=("https://github.com/siphr/alephs/archive/refs/tags/$pkgver.tar.gz")
url=https://techtum.dev/work-alephs-220621.html#work-alephs-220621
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m alephs.alephs "$@"' > _alephs
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mv _alephs "$pkgdir/usr/bin/alephs"
    chmod +x $pkgdir/usr/bin/alephs

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up ALEPHS.'
}
md5sums=('SKIP')
