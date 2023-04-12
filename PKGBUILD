# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=intelxed
_pkgname=xed
pkgver=2022.10.11
pkgrel=1
pkgdesc="Intel x86 encoder decoder"
arch=('x86_64')
url="https://intelxed.github.io"
license=('Apache')
depends=()
makedepends=('mbuild' 'doxygen')
conflicts=('xed')
source=("https://github.com/intelxed/xed/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3ddd354d15481b62c1ace0c1faf0496b1ea933d43f7431a2dff93e19b530240f')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./mfile.py --static install $MAKEFLAGS
    ./mfile.py --shared install $MAKEFLAGS
    ./mfile.py doc doc-build examples install $MAKEFLAGS
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"/kits/xed-install-base-*-lin-x86-64

    # install binaries, headers, and libraries
    install -Dm 755 -t "$pkgdir/usr/bin" bin/*
    install -dm 755 "$pkgdir/usr/include"
    cp -r include/* "$pkgdir/usr/include/"
    install -Dm 644 -t "$pkgdir/usr/lib" lib/*

    # install docs and examples
    install -dm 755 "$pkgdir/usr/share/doc"
    cp -r doc/ref-manual/* "$pkgdir/usr/share/doc/"
    install -Dm 644 -t "$pkgdir/usr/share/$pkgname/examples" examples/*
}

# vim: set sw=4 ts=4 et:
