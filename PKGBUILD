# Maintainer: Victor Tran <vicr12345 at gmail dot com>

wayland_protocols_version=1.25

pkgname=libtdesktopenvironment
pkgver=rc1
pkgrel=2
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('the-libs' 'qt5-svg' 'qt5-x11extras' 'qt5-base' 'glib2' 'libx11' 'libxss' 'libxext' 'libxrandr' 'networkmanager-qt' 'pulseaudio-qt' 'qt5-wayland')
makedepends=('qt5-tools' 'git')
source=("git+https://github.com/vicr123/libtdesktopenvironment.git#tag=rc1"
        "git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git"
        "git+https://github.com/swaywm/wlr-protocols.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd libtdesktopenvironment
    git submodule init
    git config submodule.lib/wayland-protocols/wayland-protocols.url "$srcdir/wayland-protocols"
    git config submodule.lib/wayland-protocols/wlr-protocols.url "$srcdir/wlr-protocols"
    git -c protocol.file.allow=always submodule update
}

build() {
	cd libtdesktopenvironment
        mkdir build
        cd build
	qmake ..
	make
}

package() {
	cd libtdesktopenvironment/build
	make install INSTALL_ROOT=$pkgdir
        
}
