# Maintainer: Lerentis <lerentis@burntbunch.org>
pkgname=index-fm-git
pkgver=v1.1.1.r26.g1101ebb
pkgrel=1
pkgdesc="Index is a file manager that works on desktops, Android and Plasma Mobile"
arch=('any')
url="https://invent.kde.org/maui/index-fm"
license=('GPL3')
depends=('git' 'mauikit-git' 'qmltermwidget')
makedepends=('cmake' 'extra-cmake-modules')
source=("git+https://invent.kde.org/maui/index-fm.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${pkgname%-git}"
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
    make
}

package() {
    cd "${pkgname%-git}"
    install -d $pkgdir/usr/bin
    make prefix=$pkgdir/usr install
}
