# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=updfparser
pkgver=0.1
pkgrel=1
pkgdesc="Very simple PDF parser"
arch=('any')
url="https://forge.soutade.fr/soutade/uPDFParser"
license=('LGPL-3.0-or-later')
conflicts=('updfparser-git')
makedepends=(
    'curl'
)
depends=(
    'libgcc'
    'glibc'
    'libstdc++'    
)
source=("uPDFParser-$pkgver.tar.gz::https://forge.soutade.fr/soutade/uPDFParser/archive/v$pkgver.tar.gz")
sha256sums=('520f4938b78386ae5e42a7876294cd4f61c5ef7425c906ca3449140ea447226e')
# For dealing with the humanity check
_cookie=$(curl -s https://forge.soutade.fr/402.html | sed -nE 's/.*document\.cookie = "([^;"]*).*/\1/p')
DLAGENTS=("https::/usr/bin/curl -b $_cookie -o %o %u")

build() {
    cd updfparser
    export CXXFLAGS+=" -std=c++17"
    make BUILD_STATIC=0 BUILD_SHARED=1
}

package() {
    cd updfparser
    install -Dm644 include/*.h -t "$pkgdir/usr/include/"
    install -Dm644 libupdfparser.so -t "$pkgdir/usr/lib/"
}

