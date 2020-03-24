# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=thplayer-git
pkgver=r29.4ba4371
pkgrel=1
pkgdesc='TouHou BGM player for all platform.'
arch=('x86_64')
url='https://github.com/BearKidsTeam/thplayer'
license=('BSD')
depends=(
    'qt5-multimedia'
)
makedepends=(
    'git'
    'qt5-tools'
)
source=(
    'git+https://github.com/BearKidsTeam/thplayer.git'
    'git+https://github.com/thpatch/thtk.git'
)
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd ${srcdir}/thplayer

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/thplayer
    git submodule init
    git config submodule.thtk.url ${srcdir}/thtk
    git submodule update
}

build () {
    cd ${srcdir}/thplayer
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd ${srcdir}/thplayer
    make INSTALL_ROOT="$pkgdir" install
    install -D ./COPYING ${pkgdir}/usr/share/licenses/thplayer-git/LICENSE
    install -D ./assets/thplayer.desktop ${pkgdir}/usr/share/applications/thplayer.desktop
    install -D ./assets/thplayer.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/thplayer.svg
    install -D ./assets/thplayer.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/thplayer.png
}
