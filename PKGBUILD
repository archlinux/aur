# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=fcitx-minimal-git
pkgver=4.2.9
pkgrel=1
pkgdesc="Flexible Context-aware Input Tool with eXtension with a minimal set of dependencies (git version)"
arch=('i686' 'x86_64')
url="http://github.com/fcitx/fcitx"
license=('GPL')

makedepends=('git' 'intltool' 'cmake' 'extra-cmake-modules' 'iso-codes')
conflicts=('fcitx')
provides=("fcitx=$pkgver")

depends=('pango' 'libxinerama' 'gtk-update-icon-cache' 'shared-mime-info' \
    'hicolor-icon-theme' 'desktop-file-utils' 'libxkbfile' \
    'libxfixes' 'dbus' 'libxkbcommon')

install=fcitx.install

source=("git://github.com/fcitx/fcitx.git")
md5sums=('SKIP')

_gitroot="fcitx"

pkgver() {
    cd "$srcdir/$_gitroot"
    git describe --always | sed 's|-|.|g'
}

build() {
    mkdir -p "$srcdir/$_gitroot/build"
    msg "Starting make..."
    cd "$srcdir/$_gitroot/build"
    cmake ".." \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_OPENCC=OFF \
				-DENABLE_PINYIN=OFF \
        -DENABLE_TABLE=OFF \
        -DENABLE_ENCHANT=OFF \
				-DENABLE_PRESAGE=OFF \
				-DENABLE_QT=OFF \
				-DENABLE_QT_IM_MODULE=OFF \
        -DENABLE_SNOOPER=OFF \
        -DENABLE_GIR=OFF \
        -DENABLE_ENCHANT=OFF
    make
}

package() {
    cd "$srcdir/$_gitroot/build"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

