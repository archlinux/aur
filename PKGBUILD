# Maintainer: Ckat <ckat@teknik.io>
pkgname=chatterino2-git
pkgver=r2971.f02e6acc
pkgrel=1
pkgdesc='Second installment of the Twitch chat client series "Chatterino", dev/git version'
arch=('any')
url=https://chatterino.com
license=('MIT')
depends=('qt5-multimedia' 'qt5-base' 'boost-libs')
makedepends=('git' 'qt5-svg' 'boost')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=('chatterino')
conflicts=('chatterino')
install=$pkgname.install
source=("git://github.com/Chatterino/chatterino2")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/chatterino2"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd "$srcdir/chatterino2"
    git submodule update --init --recursive --progress
}

build() {
    cd "$srcdir/chatterino2"
    mkdir build
    cd build
    qmake ..
    make
}

package() {
    cd "$srcdir/chatterino2"
    install -Dm755 "build/bin/chatterino" "$pkgdir/usr/bin/chatterino"
    install -Dm644 "resources/com.chatterino.chatterino.desktop" "$pkgdir/usr/share/applications/com.chatterino.chatterino.desktop"
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/chatterino.png"
}
