##########################################################
#                       WARNING!                         #
# inori comes with keybindings optimized for dvorak.     #
# set this variable to enable QWERTY/VIM movement keys:  #
qwerty=false
# see the readme for details!                            #
##########################################################

pkgname=inori
pkgver=0.1.0
pkgrel=1
pkgdesc="terminal mpd client with effective searching"
arch=('x86_64')
url="https://github.com/eshrh/inori"
license=('GPL-3.0')
depends=('mpd')
makedepends=('rust')
source=("inori-${pkgver}.tar.gz::https://github.com/eshrh/inori/archive/v${pkgver}.tar.gz")
sha256sums=('5d7c3595b3bce35298c28bfb6acd8d6dd2999201485faa3b50bf09b55bf9cb95')
conflicts=()

build() {
    cd ${pkgname}-${pkgver}
    if [ "$qwerty" = true ] ; then
        cargo build --release --locked --no-default-features \
              --features qwerty_movement_keys --target-dir=target
    else
        cargo build --release --locked --target-dir=target
    fi
}


package() {
    cd "inori-${pkgver}"
    install -Dvm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
