# Maintainer: Shadowsith <philip.mayer@shadowsith.de>

pkgname=qpicospeaker-git
pkgsrc=qpicospeaker
pkgver=r15.5331623
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
    qmake ../qpicospeaker/qpicospeaker/qpicospeaker.pro
    make
}

package() {
    install -Dm755 ./build/qpicospeaker "$pkgdir/usr/bin/qpicospeaker"
    install -Dm755 ./qpicospeaker/icons/qpicospeaker.png "$pkgdir$HOME/.local/share/icons/hicolor/32x32/apps/qpicospeaker.png"
}
