pkgname=nedit-ng-git
pkgver=r2782.b72ec0cc
pkgrel=1
pkgdesc="a Qt port of the Nirvana Editor (NEdit) version 5.6"
arch=("x86_64")
url="https://github.com/eteran/nedit-ng"
license=('GPL2')
groups=()
depends=('qt5-base' 'qt5-x11extras')
makedepends=('git' 'cmake' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('nedit-ng::git+https://github.com/eteran/nedit-ng.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    mkdir build
}

build() {
    cd "${srcdir}/${pkgname%-git}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make DESTDIR="$pkgdir" install
}
