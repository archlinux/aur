# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=fresco
pkgver=3.4
pkgrel=1
pkgdesc="Coupled reaction channels calculations"
arch=(i686 x86_64)
url=http://fresco.org.uk
license=(GPL3)
makedepends=(gcc-fortran)
source=(https://github.com/I-Thompson/fresco/archive/refs/tags/fresco3.4.zip deps.mk)
sha256sums=('79a2b454d4eba6073d15d06e7d01808e7f6683fbd06acca3e472ef7dc2a26bd8'
            'b9baa13ae1b1c015800d12350d051d74e537a5f418ec7ffaae958f71d8c702d7')

build() {
    cat "$srcdir/deps.mk" >>"$srcdir/fresco-fresco$pkgver/source/makefile"
    cd "$srcdir/fresco-fresco$pkgver/source"
    make FC=gfortran FFLAGS="-O2 -Wall"
}

package() {
    cd "$srcdir/fresco-fresco$pkgver/source"
    install -Dm755 fresco  "$pkgdir/usr/bin/fresco"
    install -Dm755 sfresco "$pkgdir/usr/bin/sfresco"
}
