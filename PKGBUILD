# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir-git
_pkgname=mir
pkgver=v0.31.2+334+ge26dbf576b
pkgrel=1
pkgdesc='The Mir compositor'
url='https://mir-server.io'
arch=(x86_64)
license=(GPL LGPL)
conflicts=(mir)
provides=(mir)
depends=(boost gcovr lcov capnproto google-glog gflags valgrind liburcu lttng-ust libepoxy nettle libinput libxml++2.6 libxkbcommon python-pillow freetype2 gmock libevdev umockdev python-dbusmock python-dbus python-gobject)
makedepends=(git glm doxygen)
optdepends=('qterminal: required for miral demos'
            'xcursor-dmz: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos')
source=('git+https://github.com/MirServer/mir.git'
        'https://raw.githubusercontent.com/capnproto/capnproto/04fd66e2992a3ed38d686642a3c479a7f3e131c9/c%2B%2B/cmake/FindCapnProto.cmake')
sha256sums=('SKIP'
            '83153402ea0220a9ed3f9d2c2c157eb49fedf340f368cd8173f0966b3fbf2647')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g'
}
            
prepare() {
    cd ${_pkgname}
    git submodule init
    git submodule update
    cp ../FindCapnProto.cmake cmake/
}

build() {
    cd ${_pkgname}
    ./native-compile.sh
}

package() {
    cd ${_pkgname}/build-linux-x86
    make DESTDIR="${pkgdir}/" install

}
# vim:set ts=2 sw=2 et:
