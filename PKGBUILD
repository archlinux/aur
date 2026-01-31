# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.60
pkgrel=1
pkgdesc='Cross-platform library for building Telegram clients'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf' 'git')
provides=('telegram-tdlib')
conflicts=('telegram-tdlib')
options=('!lto' '!debug')
source=("git+https://github.com/tdlib/td.git#commit=0da5c72f8365fb4857096e716d53175ddbdf5a15")
sha256sums=('15b6aaf55bf1ec940bef624cc2df3d620a721d9cb223f30540b06386dcf5ce43')

build() {
    mkdir -p "td/build"
    cd "td/build" || exit
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release ..
    cmake --build .
}

package() {
    cd "td/build" || exit
    mkdir -p "$pkgdir"/usr
    DESTDIR="$pkgdir" cmake --build . --target install
}
