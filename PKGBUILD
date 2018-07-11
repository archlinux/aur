# Maintainer: Shadowsith <philip.mayer@shadowsith.de>

pkgname=qpicospeaker-git
pkgsrc=qpicospeaker
pkgver=r19.f92a59b
pkgrel=1
pkgdesc='Qt GUI for the svox-pico text-to-speech engine'
arch=('i686' 'x86_64')
url='https://github.com/Shadowsith/qpicospeaker'
licence=('MIT')
depends=('sox' 'svox-pico-bin')
makedepends=('qt5-base' 'qt5-multimedia')
optdepends=()
provides=('')
backup=("")
install=
source=("git+https://github.com/Shadowsith/qpicospeaker")
sha256sums=('SKIP')

prepare() {
    build=build
    pwd
    if [ -d "$build"]; then
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
    cd build
    qmake ../qpicospeaker/qpicospeaker.pro
    make
}

package() {
    install -Dm755 ./build/qpicospeaker "$pkgdir/usr/bin/qpicospeaker"
    install -Dm666 ./qpicospeaker/data/icons/32x32/qpicospeaker.png "$pkgdir/usr/share/icons/hicolor/32x32/qpicospeaker.png"
    install -d -Dm666 "$pkgdir/usr/share/qpicospeaker/data/icons"
    install -Dm666 ./qpicospeaker/data/icons/qpicospeaker.svg "$pkgdir/usr/share/qpicospeaker/data/icons/qpicospeaker.svg"
    install -Dm666 ./qpicospeaker/data/desktop/qpicospeaker.desktop "$pkgdir/usr/share/applications/qpicospeaker.desktop"
}
