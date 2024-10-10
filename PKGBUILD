# Maintainer: Yifan Zhu <fanzhuyifan[at]gmail[dot]com>

pkgname=kwin-effect-reflect-cursor-git
_pkgname="${pkgname%-git}"
pkgver=0.1.r2.eb90b4b
pkgrel=1
pkgdesc='Reflect cursor effect for kwin'
arch=('x86_64')
url='https://github.com/fanzhuyifan/kwin-effect-reflect-cursor'
license=('GPL-2.0-or-later')
depends=(gcc-libs
         glibc
         kconfig
         kcoreaddons
         kwin
         qt6-base)
makedepends=(cmake
             extra-cmake-modules
             git)
provides=(${_pkgname})
source=("$_pkgname::git+https://github.com/fanzhuyifan/kwin-effect-reflect-cursor")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"

    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
