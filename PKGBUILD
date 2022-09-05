# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=simavr-picsimlab
_pkgbasename=simavr
pkgver=1.7
pkgrel=1
pkgdesc="a lean, mean and hackable AVR simulator for linux & OSX - picsimlab fork"
arch=('x86_64' 'aarch64')
url="https://github.com/lcgamboa/simavr"
depends=('glu' 'freeglut' 'avr-gcc')
provides=('simavr')
conflicts=('simavr')
license=('GPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec9668aab8c07b784e3d7e1fb235b88787cae72e29dc7ecb284dd6d2f5b4db8c')

build() {
    cd "${_pkgbasename}-$pkgver"
    make RELEASE=1 build-simavr
    make RELEASE=1 -C examples/parts
}

package() {
    cd "${_pkgbasename}-$pkgver"
    make DESTDIR="$pkgdir/usr" PREFIX="/usr" RELEASE=1 install
}
