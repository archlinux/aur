# Maintainer: siphr <archlinux@techtum.dev>
pkgname=rwu
pypkgname=urw
pkgver=0.0.6
pkgrel=1
pkgdesc="Random Urdu words/phrases generator."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/urw/archive/refs/tags/0.0.6.tar.gz")
url=https://www.techtum.dev/work-urw-220310.html
license=('MIT')

build() {
    echo "PREPARING..."
    cd $srcdir/$pypkgname-$pkgver/pip/
    python setup.py build
    echo -e '#!/bin/sh\n\nexec python -m urw.urw "$@"' > rwu
}

package() {
    echo "INSTALLING..."
    echo $pkgdir/$pypkgname-$pkgver
    cd $srcdir/$pypkgname-$pkgver/pip
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir $pkgdir/usr/bin
    cp rwu $pkgdir/usr/bin/rwu
    chmod +x $pkgdir/usr/bin/rwu

    echo 'Finished setting up rwu.'
}

md5sums=('SKIP')
