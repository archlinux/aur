# Maintainer: Rihards Skuja <rhssk at posteo eu>
_pkgname=kpeoplevcard
pkgname=$_pkgname-git
pkgver=r38.32d50a9
pkgrel=1
pkgdesc="KPeople VCard Support"
arch=(x86_64)
url="https://phabricator.kde.org/source/$_pkgname/"
license=("GPL")
depends=(kpeople kcontacts)
makedepends=(git extra-cmake-modules)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+git://anongit.kde.org/$_pkgname")
md5sums=("SKIP")

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$_pkgname
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir/" install
}
