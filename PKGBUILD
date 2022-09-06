# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=ucsim-picsimlab
_basename=uCsim_picsimlab
pkgver=0.6.0
pkgrel=1
pkgdesc="uCsim version with minor modifications and some extra code to function as a PICSimLab simulation backend"
arch=('x86_64' 'aarch64')
url="https://github.com/lcgamboa/uCsim_picsimlab"
license=('GPL2')
depends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6fe05d6c4906440bbf6b326de78db00a2fb48956e7418de64df6a17eb5bf3324')
makedepends=('flex' 'bison' 'gcc' 'make')
conflicts=('ucsim')
provides=('ucsim')

prepare() {
    cd "$_basename-$pkgver"
    autoupdate
    autoreconf --install
    ./configure --prefix="/usr"
}

build() {
    cd "$_basename-$pkgver"
    make CXXFLAGS="-fPIC"
    make -C picsimlab
}

package() {
    cd "$_basename-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -d -m 755 "$pkgdir/usr/lib"
    make -C picsimlab DESTDIR="$pkgdir/usr" install
}
