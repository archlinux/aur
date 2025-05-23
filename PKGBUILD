# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Wu Junyu <wu DOT junyu DOT aur AT outlook DOT com>

pkgname=mopac
pkgver=23.1.2
pkgrel=1
pkgdesc='Molecular Orbital PACkage'
arch=(x86_64)
url='https://github.com/openmopac/mopac'
license=(Apache-2.0)
depends=(blas lapack)
makedepends=(gcc-fortran cmake)
checkdepends=(python python-numpy)
provides=(mopac)
replaces=(mopac7)
conflicts=(mopac7)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('60436bbf62045f06f17b4604bf241c8c6359a70a89c41d00913833bf32ea0121')

build(){
    cd "$pkgname-$pkgver"
    cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
    cmake --build build $MAKEFLAGS
}

check(){
    cd "$pkgname-$pkgver"
    ctest --test-dir build $MAKEFLAGS
}

package(){
    cd "$pkgname-$pkgver"
    cmake --install build --prefix "$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
