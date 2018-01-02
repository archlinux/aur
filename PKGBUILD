# Maintainer: Ckat <ckat@teknik.io>

_name=chatterino2
pkgname="$_name-git"
pkgver=r365.de332db
pkgrel=1
pkgdesc='Chatterino 2 is the second installment of the Twitch chat client series "Chatterino". dev/git version.'
arch=('any')
url=https://chatterino.com
license=('MIT')
install=$pkgname.install
provides=("${_name%2}")
conflicts=("${_name%2}")
depends=('rapidjson' 'gst-plugins-ugly' 'gst-plugins-good' 'qt5-multimedia' 'qt5-base' 'qt5-svg' 'pulseaudio')
makedepends=('boost' 'git')
source=("${_name%2}.png" "${_name%2}.desktop" "git://github.com/fourtf/$_name")
sha1sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd "$srcdir/$_name"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_name"
    mkdir build
    cd build
    qmake ..
    make
}

package() {
    cd "$srcdir/$_name/build"
    install -Dm755 ./"${_name%2}" "$pkgdir/usr/bin/${_name%2}"
    install -Dm644 "$srcdir/${_name%2}.desktop" "$pkgdir/usr/share/applications/${_name%2}.desktop"
    install -Dm644 "$srcdir/${_name%2}.png" "$pkgdir/usr/share/pixmaps/${_name%2}.png"
}
