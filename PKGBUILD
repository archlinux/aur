# Maintainer: Papangkorn Apinyanon <dev@papangkorn.com>
pkgname=sslide
pkgver=0.0.9
pkgrel=1
pkgdesc="Simple presentation program"
arch=('x86_64')
url="https://codeberg.org/sleepntsheep/sdraw"
license=('GPL3')
groups=()
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'fontconfig')
makedepends=( 'premake' 'make' )
optdepends=()
provides=('sslide')
conflicts=('sslide')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeberg.org/sleepntsheep/sslide/archive/$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')

build() {
    cd "$pkgname/"
    premake5 gmake2
}

package() {
    whoami
    cd "$pkgname/"
    make config=release
    install -Dm755 ./Release/sslide "${pkgdir}/usr/local/bin/sslide"
    install -Dm755 ./Release/sslide-maker "${pkgdir}/usr/local/bin/sslide-maker"
    desktop-file-install --dir=$HOME/.local/share/applications sslide.desktop
    desktop-file-install --dir=$HOME/.local/share/applications sslide-maker.desktop
}

