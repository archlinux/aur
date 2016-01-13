# Maintainer: Ranndom <Ranndom@rnndm.xyz>

pkgname=bitlbee-discord-git
pkgver=74.ae894c5
pkgrel=1
pkgdesc="Bitlbee plugin for Discord"
arch=('i686' 'x86_64')
url="https://github.com/sm00th/bitlbee-discord"
license=('GPL')
depends=('bitlbee')
makedepends=('git' 'libwebsockets-git' 'autoconf' 'automake' 'libtool')
source=("git+https://github.com/sm00th/bitlbee-discord")
sha256sums=('SKIP')

pkgver() {
    cd "bitlbee-discord"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "bitlbee-discord"
    ./autogen.sh
    # libwebsockets-git is screwed up pkg-config wise
    PKG_CONFIG_PATH="/usr/lib/lib64/pkgconfig" LIBWEBSOCKETS_LIBS="-L/usr/lib/lib64" ./configure
    make
}

package() {
    cd "bitlbee-discord"
    make DESTDIR="$pkgdir" install
}
