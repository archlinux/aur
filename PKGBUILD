# Maintainer:  Lukas K. <lu@0x83.eu>

_name=horizon
pkgname=${_name}-git
pkgver=r185.59b2f6b
pkgrel=2
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://github.com/carrotIndustries/horizon"
license=('GPL')
depends=('yaml-cpp' 'zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo')
makedepends=('boost-libs' 'boost' 'glm')
source=("git+https://github.com/carrotIndustries/horizon.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_name"
    make
}

package() {
    for f in horizon-imp horizon-pool horizon-eda horizon-prj
    do
        install -Dm755 $srcdir/$_name/$f $pkgdir/usr/bin/$f
    done
}
