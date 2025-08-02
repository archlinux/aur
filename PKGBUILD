# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Wu Junyu <wu DOT junyu DOT aur AT outlook DOT com>

pkgname=gau2grid
pkgver=2.0.9
pkgrel=1
pkgdesc='Fast computation of a gaussian and its derivative on a grid.'
arch=('x86_64')
url='https://github.com/psi4/gau2grid'
license=(BSD-3-Clause)
makedepends=(cmake python python-numpy python-setuptools)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7879bdddf3a52cd2a051086215977822bbe8d1af927fcf5b4fb0256a38b8a76c')

build(){
    cd $pkgname-$pkgver
    cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package(){
    cd "$pkgname-$pkgver"
    cmake --install build --prefix "$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # mv $pkgdir/usr/share/cmake/gau2grid $pkgdir/usr/share
    # sed -r -i "s:\\${_IMPORT_PREFIX}/include:\\${_IMPORT_PREFIX}/usr/include:g" $pkgdir/usr/share/gau2gridTargets.cmake
}
