# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=ktelephone
pkgname=${_pkgname}-git
pkgver=r80.f82037b
pkgrel=1
pkgdesc="Qt softphone - Highly inspired by Telephone"
arch=(x86_64)
url="https://github.com/StefanYohansson/ktelephone"
license=("GPL3")
depends=("pjproject" "qt5-multimedia")
makedepends=("git" "cmake")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/StefanYohansson/ktelephone")
sha512sums=('SKIP')


pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "build"
}

build() {
    cd "build"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "../$_pkgname"
        
    make
}

package() {
    cd "build"

    make DESTDIR="$pkgdir/" install
}
