# Maintainer: Ivan Molchanov <ia.molc@ya.ru>
pkgname="krdc-xfreerdp"
pkgver="23.08.5"
pkgrel="1"
pkgdesc="Remote Desktop Client(old version with xfreerdp)"
arch=("x86_64")
makedepends=(git extra-cmake-modules)
depends=(gcc-libs glibc kactivities5  kbookmarks5 kcmutils5 kcompletion5  kconfig5  kconfigwidgets5 kcoreaddons5  kdnssd5 ki18n5  kio5  knotifications5 knotifyconfig5  kwidgetsaddons5 kwallet5  kxmlgui5  qt5-base)
optdepends=('libvncserver: VNC support'
            'libssh: VNC support'
            'freerdp: RDP support'
            'keditbookmarks: to edit bookmarks'
)
provides=(krdc)
conflicts=(krdc)
url=https://apps.kde.org/krdc/
license=("GPL-2.0-or-later" "LGPL-2.0-or-later")

source=('https://github.com/KDE/krdc/archive/refs/tags/v23.08.5.tar.gz')
sha256sums=('a74cea6f820b46fc2d6cfdc4e759b160c10d8c8c3e59e29b9b6db6871f902319')

prepare() {
    mkdir -p build
    cd build
    cmake ../krdc-23.08.5 \
        -DHAVE_XFREERDP=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DBUILD_TESTING=OFF
    make -j$(($(nproc)-1))
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
