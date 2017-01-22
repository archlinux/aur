pkgname=tgfs
pkgver=0.1
pkgrel=2
pkgdesc="user-space filesystem for Telegram attachments"
arch=('i686' 'x86_64')
url="https://github.com/Firemoon777/tgfs"
license=('GPL3')
depends=('libconfig' 'libevent' 'jansson' 'fuse2')
makedepends=('git')
conflicts=('tgfs')
provides=('tgfs')

source=("$pkgname"::'git+https://github.com/Firemoon777/tgfs')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
    ./configure
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 bin/telegram-tgfs ${pkgdir}/usr/bin/telegram-tgfs
    install -Dm755 bin/tgfs ${pkgdir}/usr/bin/tgfs
}

