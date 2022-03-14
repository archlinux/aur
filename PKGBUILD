# Maintainer: siphr <archlinux@techtum.dev>

pkgname=spcs
pkgver=0.0.1
pkgrel=1
pkgdesc="Pakistan Sindh Police Complaints Status."
depends=(python python-beautifulsoup4)
arch=(any)

source=("https://github.com/siphr/spcs/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-spcs-220121.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m spcs.spcs "$@"' > _spcs
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mv _spcs "$pkgdir/usr/bin/spcs"
    chmod +x $pkgdir/usr/bin/spcs

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up spcs.'
}
md5sums=('SKIP')
