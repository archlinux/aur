# Maintainer: siphr <archlinux@techtum.dev>

pkgname=c19
pkgver=0.0.7
pkgrel=1
pkgdesc="COVID-19 Stats for the country of Pakistan."
depends=(python python-pycountry)
arch=(any)
source=("https://github.com/siphr/c19/archive/refs/tags/$pkgver.tar.gz")
url=https://www.techtum.dev/work-c19-220109.html
license=('MIT')

build() {
    echo "BUILDING..."
    cd "$srcdir/$pkgname-$pkgver/pip/"
    python setup.py build

    echo -e '#!/bin/sh\n\nexec python -m c19.c19 "$@"' > _c19
    #echo "python -m c19 \$@" >> c19
}

package() {
    echo "INSTALLING..."
    cd "$srcdir/$pkgname-$pkgver/pip"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/bin
    cp _c19 "$pkgdir/usr/bin/c19"
    chmod +x "$pkgdir/usr/bin/c19"

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo 'Finished setting up c19.'
}
md5sums=('72e3b38c73b0cd380eb9f7685fa7d7e7')
