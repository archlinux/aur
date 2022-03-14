# Maintainer: siphr <archlinux@techtum.dev>

_pypkgname=psg
pkgname=pksg
pkgver=0.0.5
pkgrel=1
pkgdesc="Pakistan SUI Gass Bill and Tariff."
depends=(python python-beautifulsoup4)
arch=(any)

source=("https://github.com/siphr/psg/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-psg-220228.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$_pypkgname-$pkgver/pip/"
    python setup.py build
    
    echo -e '#!/bin/sh\n\nexec python -m psg.psg "$@"' > _psg
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$_pypkgname-$pkgver/pip/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    mv _psg "$pkgdir/usr/bin/pksg"
    chmod +x $pkgdir/usr/bin/pksg

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up pkgs.'
}

md5sums=('80d27050b2074843618825e5a462fde8')
