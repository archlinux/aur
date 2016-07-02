 pkgname=kodi-addon-pvr-vuplus-git
_gitname=pvr.vuplus
pkgver=r111.1cc8b62
pkgrel=1
pkgdesc='VU+ addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git' 'kodi-platform-git' )
provides=('kodi-addon-pvr-vuplus');
conflicts=('kodi-addon-pvr-vuplus');
depends=('kodi')
source=("git+https://github.com/kodi-pvr/${_gitname}.git#branch=Jarvis")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"

    rm -rf build
    mkdir build
    cd build

    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi -DCMAKE_BUILD_TYPE=Release  || return 1
    make || return 1
}

package() {
    cd "${srcdir}/${_gitname}/build"

    make DESTDIR="$pkgdir" install
}
