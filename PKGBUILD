# Contributor: Christoph Lehmann (OpenGeoSys)
pkgname=mgis
pkgver=r37.bb667ad
pkgrel=1
pkgdesc="Support for MFront generic behaviours"
arch=("x86_64")
url="https://github.com/thelfer/MFrontGenericInterfaceSupport"
license=('LGPL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%}" mfront-generic-interface-support)
conflicts=("${pkgname%}" "${pkgname%-git}" mfront-generic-interface-support)
replaces=()
backup=()
options=()
install=
source=('mgis::git+https://github.com/thelfer/MFrontGenericInterfaceSupport.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/mgis"

    # Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"
    mkdir -p build
    cd build
    cmake "../mgis" -DCMAKE_BUILD_TYPE=Debug
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
