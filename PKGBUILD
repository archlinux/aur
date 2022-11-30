# Maintainer: Dakeryas <mrdakeryas at gmail dot com>
pkgname=mac-optimised
pkgver=8.99
pkgrel=6
pkgdesc="Monkey's Audio library and command line APE converter with optimised build flags (from SDK)"
arch=('i686' 'x86_64')
url="https://monkeysaudio.com/developers.html"
license=("Monkey's Audio License Agreement")
provides=('mac')
conflicts=('mac')
makedepends=('gcc' 'make')
source=('https://monkeysaudio.com/files/MAC_899_SDK.zip')
sha256sums=('f943f5bc4b24e3a694998006001b82853c2341691c265b2e6f8ceb7d5564c8d9')

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
