# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=klamrisk-hero
pkgver=1
pkgrel=1
pkgdesc="Klämrisk Hero game"
arch=('x86_64' 'i686')
url="https://www.linusakesson.net/games/klamrisk/index.php"
license=('custom')
depends=('libGL.so' 'sdl' 'sdl_ttf' 'glu' 'glibc')
source=(
    'http://scene.kryo.se/kryo-klamrisk_hero.zip'
    'x86_64.patch'
    'Klamrisk_Hero.desktop'
)
sha256sums=(
    '7dc7b4f043480e2cf6d77f3cba51f463748cd48aaac161e4dd69f732608c8a4b'
    'eb3b9812ad3e5fe55e9be9e3e6279302f90ef9b865b842774c1b7bb25229988f'
    '7554e02497ed96795b92149d3f61e6020af003d044a56663bdb4738a6ceea1de'
)
options=(!strip !debug)
_src="kryo-klamrisk_hero/source"

prepare() {
    if [[ $CARCH == "x86_64" ]]; then
        cd $_src
        patch -Np1 < $srcdir/x86_64.patch
    fi
}


build() {
    cd $_src
    make
}

package() {
    install -Dm755 $_src/klamrisk -t $pkgdir/usr/bin/
    install -Dm644 Klamrisk_Hero.desktop -t $pkgdir/usr/share/applications/
}
