# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: William Gathoye <william + aur at gathoye dot be>
# Contributor: zzy-ac <m@m-l.cc>


pkgname=plasma-applet-netspeed-git
_gitname=plasma-applet-netspeed-widget
pkgver=r54.db8ff30
pkgrel=1
pkgdesc="Plasma widget that displays the currently used network bandwidth"
arch=('any')
url="https://github.com/dfaust/plasma-applet-netspeed-widget"
license=('GPL2')
depends=(
    'awk'
    'plasma-workspace'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
   cd ${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   
}

build() {
    cmake -B build -S "${_gitname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

