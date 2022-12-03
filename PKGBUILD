# Maintainer: Dakeryas <mrdakeryas at gmail dot com>
pkgname=mac-optimised
pkgver=9.01
pkgrel=6
pkgdesc="Monkey's Audio library and command line APE converter with optimised build flags (from SDK)"
arch=('i686' 'x86_64')
url="https://monkeysaudio.com/developers.html"
license=("Monkey's Audio License Agreement")
provides=('mac')
conflicts=('mac')
makedepends=('gcc' 'make')
source=('https://monkeysaudio.com/files/MAC_901_SDK.zip')
sha256sums=('6f1230177396e6d1ca148b8f6128ea904dddff9f8fe52231168b5923e93e73f1')

_project_path() {
    echo "$srcdir/Source/Projects/NonWindows"
}

build() {
    cd $(_project_path)
    export prefix=/usr
    export CXXFLAGS="${CXXFLAGS} -O3 -march=native"
    export LDFLAGS="${LDFLAGS} -Wl,-rpath,\\$\$ORIGIN/../lib"
    make
}

package() {
    cd $(_project_path)
    make DESTDIR="$pkgdir/" install
}
