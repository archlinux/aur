# Maintainer: taotieren <admin@taotieren.com>

pkgname=domruler-git
pkgver=b5144f7
pkgrel=1
pkgdesc="DOM Ruler is a library to maintain a DOM tree, lay out and stylize the DOM elements by using CSS."
arch=('any')
url="https://github.com/HVML/DOM-Ruler"
license=('LGPL-3.0')
provides=(${pkgname%-git}  'DOM-Ruler')
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('cmake' 'gcc' 'glib2' 'purc' )
makedepends=('git' 'cmake' 'ninja')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
#     git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
# CMake build
#     cmake -B build
#     cmake --build build

# Ninja build
    cmake -B build -G Ninja
    ninja -C build
}

package() {
# make install
#     make -C "${srcdir}"/${pkgname%-git}/build install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
