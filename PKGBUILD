# Maintainer: Maria Lisina <sekoohaka.sarisan@gmail.com>

pkgname=telegram-bot-api
pkgver=6.9.2
pkgrel=1
pkgdesc="Telegram Bot API server"
arch=('x86_64')
url="https://core.telegram.org/bots"
license=('Boost')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cmake>=3.0.2' 'gcc>=4.9.2' 'git' 'gperf')
provides=('telegram-bot-api')
conflicts=('telegram-bot-api-git')
_commit=96d0d1c6689451207bc66d179983c10949322823
_commit1=9184b3e62de59663a59d3500528aee7e5f0d83fa
source=("git+https://github.com/tdlib/telegram-bot-api.git#commit=$_commit"
        "git+https://github.com/tdlib/td.git#commit=$_commit1")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd telegram-bot-api
  git submodule init
  git config submodule.td.url ../td
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S telegram-bot-api -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr"
  cmake --build build
}

package() {
  cmake --build build --target install
}
