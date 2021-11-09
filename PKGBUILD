# Maintainer: Nick Econopouly <wry at mm dot st>
pkgname=jami-client-qt-git
pkgver=r683.3dd206e
pkgrel=1
pkgdesc="A free and private communication platform (QT client)"
arch=('x86_64')
provides=('jami-client-qt')
url="https://git.jami.net/savoirfairelinux/jami-client-qt"
license=('GPL3')
depends=('jami-daemon-git' 'libjamiclient-git' 'qt5-base' 'libnm' 'qrencode' 'libnotify' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-webengine')
makedepends=('git' )
conflicts=('jami-gnome-git' 'jami-gnome')
source=("git+$url.git")
sha512sums=(SKIP)

pkgver() {
    cd $srcdir/jami-client-qt
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd jami-client-qt
    mkdir -p build
    cd build
    # /usr is necessary for Arch; see https://archlinux.org/news/binaries-move-to-usrbin-requiring-update-intervention/
    cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
    make -j`nproc` # -j`nproc` uses as many cores as possible to speed up the build
}

package() {
    cd jami-client-qt/build
    make install
}
