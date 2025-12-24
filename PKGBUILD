# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.8.59
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
source=("git+https://github.com/tdlib/td.git#commit=89e7366783e13d63085878ba407da83107ccd401")
sha256sums=('38e73e72eefd735a5fe1addee70422febf4ddf73afedd22e3ea4580a4982d941')

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
