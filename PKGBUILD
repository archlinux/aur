# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=fresco
pkgver=3.1
pkgrel=1
pkgdesc="Coupled reaction channels calculations"
arch=(i686 x86_64)
url=http://fresco.org.uk
license=(GPL3)
makedepends=(gcc-fortran)
source=(http://fresco.org.uk/source/fres-v31.tar.gz deps.mk)
sha256sums=('47f87e47bd94635b6f7fdcb0cb2ea150c374f1e2987c2902081596a65bb6d170'
            'b9baa13ae1b1c015800d12350d051d74e537a5f418ec7ffaae958f71d8c702d7')

build() {
    cat "$srcdir/deps.mk" >>"$srcdir/fres/source/makefile"
    cd "$srcdir/fres/source"
    make FC=gfortran FFLAGS="-O2 -Wall"
}

package() {
    cd "$srcdir/fres/source"
    install -Dm755 fresco  "$pkgdir/usr/bin/fresco"
    install -Dm755 sfresco "$pkgdir/usr/bin/sfresco"
}
