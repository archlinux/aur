# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=leanux
pkgver=2.0.1
pkgrel=1
pkgdesc="GNU/Linux performance tools and C++ API"
arch=("i686" "x86_64" "mips" "sparc" "armv7h")
url="https://github.com/jmspit/leanux"
license=("GPLv3")
depends=("hwdata")
makedepends=("ncurses" "cmake" "zlib" "sqlite3")
source=("git+${url}#tag=${pkgver}")
sha256sums=('a9b5ebdc45d2692e36ce1081b7cc997c38983da8c9d2ef23b2b584898e90ec48')

build() {
    mkdir "${pkgname}/release"
    cd "${pkgname}/release"
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "${pkgname}/release"
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}
