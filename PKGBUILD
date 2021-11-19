# Maintainer: Nick Econopouly <wry at mm dot st>
pkgname=jami-qt-git
replaces=('jami-client-qt-git')
pkgver=r701.0a7aaa5
pkgrel=1
pkgdesc="A free and private communication platform (QT client)"
arch=('x86_64')
provides=('jami-qt')
url="https://git.jami.net/savoirfairelinux/jami-client-qt"
license=('GPL3')
depends=('jami-daemon-git' 'libjamiclient-git' 'qt5-base' 'libnm' 'qrencode' 'libnotify' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-webengine')
makedepends=('git' )
conflicts=('jami-gnome-git' 'jami-gnome' 'jami-qt')
source=("git+$url.git")
sha512sums=(SKIP)

pkgver() {
    cd $srcdir/jami-client-qt
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
     cmake -B build -S jami-client-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
    make -C build -j`nproc` # -j`nproc` uses as many cores as possible to speed up the build
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
