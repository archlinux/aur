# Contributor: Christoph Lehmann (OpenGeoSys)
pkgname=mgis-git
pkgver=r37.bb667ad
pkgrel=1
pkgdesc="Support for MFront generic behaviours"
arch=("x86_64")
url="https://github.com/thelfer/MFrontGenericInterfaceSupport"
license=('LGPL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}" mfront-generic-interface-support-git)
conflicts=("${pkgname%-git}" mfront-generic-interface-support-git)
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
