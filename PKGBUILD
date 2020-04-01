#
# Maintainer: kentosama <kentosama@genku.net>
#

pkgname=blastem-pre
pkgver=0.6.3
pkgrel=1
pkgdesc="BlastEm is an open source, higly accurate emulator for the Genesis/Megadrive that runs on modest hardware."
url="https://www.retrodev.com/blastem/"
arch=("x86_64")
license=('GPL3')
depends=("sdl2" "glew")
provides=("$pkgname")
conflicts=("blastem" "blastem-hg")
_prever="00fb99805445"
source=("https://www.retrodev.com/repos/blastem/archive/$_prever.tar.gz")
md5sums=("8ff221d7f1bd68fa75fd3a59f89d1b4e")

prepare() {
    mv "$srcdir/blastem-$_prever" "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/$pkgname"
    make blastem
}

package() {
    cd "$srcdir/$pkgname"

    mkdir -p "$pkgdir/usr/games/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/games/$pkgname/$pkgname"
    install -Dm666 "$srcdir/$pkgname/default.cfg" "$pkgdir/usr/games/$pkgname/default.cfg"
    install -Dm644 "$srcdir/$pkgname/rom.db" "$pkgdir/usr/games/$pkgname/romb.db"
    install -Dm644 "$srcdir/$pkgname/gamecontrollerdb.txt" "$pkgdir/usr/games/$pkgname/gamecontrollerdb.txt"
    install -Dm644 "$srcdir/$pkgname/images/360.png" "$pkgdir/usr/games/$pkgname/images/360.png"
    install -Dm644 "$srcdir/$pkgname/images/ps4.png" "$pkgdir/usr/games/$pkgname/images/ps4.png"
    install -Dm644 "$srcdir/$pkgname/images/ps4_6b.png" "$pkgdir/usr/games/$pkgname/images/ps4_6b.png"
    install -Dm644 "$srcdir/$pkgname/shaders/crt.f.glsl" "$pkgdir/usr/games/$pkgname/shaders/crt.f.glsl"
    install -Dm644 "$srcdir/$pkgname/shaders/crt.v.glsl" "$pkgdir/usr/games/$pkgname/shaders/crt.v.glsl"
    install -Dm644 "$srcdir/$pkgname/shaders/default.f.glsl" "$pkgdir/usr/games/$pkgname/shaders/default.f.glsl"
    install -Dm644 "$srcdir/$pkgname/shaders/default.v.glsl" "$pkgdir/usr/games/$pkgname/shaders/default.v.glsl"
    install -Dm644 "$srcdir/$pkgname/shaders/sharp.f.glsl" "$pkgdir/usr/games/$pkgname/shaders/sharp.f.glsl"
    ln -s "/usr/games/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

}