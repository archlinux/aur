# Maintainer: Artem Savkov <artem.savkov@gmail.com>

pkgname=bitlbee-discord-git
pkgver=0.4.3
pkgrel=1
pkgdesc="Bitlbee plugin for Discord"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/sm00th/bitlbee-discord"
license=('GPL')
depends=('bitlbee')
makedepends=('git')
source=("git+https://github.com/sm00th/bitlbee-discord")
sha256sums=('SKIP')

pkgver() {
    cd "bitlbee-discord"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "bitlbee-discord"
    ./autogen.sh
    # TODO: remove --with-bdatadir once a version of bitlbee with "ad66dcd6 Add
    # datadir to pkgconfig file and config.h" is released
    ./configure --with-bdatadir=/usr/share/bitlbee
    make
}

package() {
    cd "bitlbee-discord"
    make DESTDIR="$pkgdir" install
}
