# Maintainer: Shadowsith <philip.mayer@shadowsith.de>

pkgname=qpicospeaker-git
pkgsrc=qpicospeaker
pkgver=r60.7429077
pkgrel=1
pkgdesc="Qt GUI for the svox-pico text-to-speech engine"
arch=('i686' 'x86_64' 'aarch64' 'arm')
url="https://github.com/Shadowsith/qpicospeaker"
licence=('MIT')
depends=(
    'sox'
    'svox-pico-bin'
)
makedepends=(
    'qt5-base'
    'qt5-multimedia'
)
backup=("")
source=("git+https://github.com/Shadowsith/qpicospeaker")
sha256sums=('SKIP')

prepare() {
    build=build
    if [ -d "$build" ]; then
        rm -r build
    fi
    if [ ! -d "$build" ]; then
        mkdir build
    fi
}

pkgver() {
  cd "$pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd qpicospeaker
    git submodule update --init --recursive
    cd ../build
    qmake ../qpicospeaker/qpicospeaker.pro
    make
}

package() {
    install -Dm755 ./build/qpicospeaker "$pkgdir/usr/bin/qpicospeaker"
    install -Dm666 ./qpicospeaker/data/icons/32x32/qpicospeaker.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/qpicospeaker.png"
    install -Dm666 ./qpicospeaker/data/icons/64x64/qpicospeaker.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/qpicospeaker.png"
    install -Dm666 ./qpicospeaker/data/icons/128x128/qpicospeaker.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/qpicospeaker.png"
    install -Dm666 ./qpicospeaker/data/desktop/qpicospeaker.desktop "$pkgdir/usr/share/applications/qpicospeaker.desktop"
}
