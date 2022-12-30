# Maintainer: siphr <archlinux@techtum.dev>

_pypkgname=pkradio
pkgname=pkradio
pkgver=0.3
pkgrel=1
pkgdesc="A Pakistani radio station player."
depends=(python)
arch=(any)
source=("https://github.com/siphr/pkradio/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-pkradio-220409.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/py/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m pkradio.pkradio "$@"' > _pkradio
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/py/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mv _pkradio "$pkgdir/usr/bin/$pkgname"
    chmod +x $pkgdir/usr/bin/$pkgname

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up pkradio.'
}

md5sums=('db00462bf01ae96017b06ed47e8fa048')
