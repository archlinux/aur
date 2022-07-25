# Maintainer: Dakeryas <mrdakeryas at gmail dot com>
pkgname=mac-optimised
pkgver=8.34
pkgrel=2
pkgdesc="Monkey's Audio library and command line APE converter with optimised build flags (from SDK)"
arch=('i686' 'x86_64')
url="https://monkeysaudio.com/developers.html"
license=("Monkey's Audio License Agreement")
provides=('mac')
conflicts=('mac')
makedepends=('gcc' 'make')
source=("https://monkeysaudio.com/files/MAC_${pkgver//.}_SDK.zip")
sha256sums=('b1d60833d38b1b54e27878f58429034f661f04987bb3d9cb2eb58ccfbb92a4b1')

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
