# Maintainer: Dakeryas <mrdakeryas at gmail dot com>
pkgname=mac-optimised
pkgver=7.38
pkgrel=2
pkgdesc="Monkey's Audio library and command line APE converter with optimised build flags (from SDK)"
arch=('i686' 'x86_64')
url="https://monkeysaudio.com/developers.html"
license=("Monkey's Audio License Agreement")
provides=('mac')
conflicts=('mac')
makedepends=('gcc' 'make')
source=("https://monkeysaudio.com/files/MAC_SDK_${pkgver//.}.zip")
sha256sums=('54dc2c847293e7fb80934db0edb6b478a776e38ead146c98e6f5fa0cbe9b21c8')

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
