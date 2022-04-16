# Maintainer: Sarisan Sekoohaka <sekoohaka.sarisan@gmail.com>

pkgname=telegram-bot-api
pkgver=6.0
pkgrel=1
pkgdesc="Telegram Bot API server"
arch=('x86_64')
url="https://core.telegram.org/bots"
license=('BSL-1.0')
depends=('openssl' 'zlib' 'gcc-libs')
makedepends=('git' 'gcc>=4.9' 'gperf' 'cmake>=3.0.2')
provides=('telegram-bot-api')
conflicts=('telegram-bot-api-git')
_commit=31d947e9713043ddd7b9f180b6c94070f2810341
_commit1=054a823c1a812ee3e038f702c6d8ba3e6974be9c
source=("git+https://github.com/tdlib/telegram-bot-api.git#commit=$_commit"
        "git+https://github.com/tdlib/td.git#commit=$_commit1")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd telegram-bot-api
  git submodule init
  git config submodule.td.url ../td
  git submodule update
}

build() {
  mkdir -p telegram-bot-api/build
  cd telegram-bot-api/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
  cmake --build . 
}

package() {
  cd telegram-bot-api/build
  mkdir -p "$pkgdir/usr"
  cmake --build . --target install
}
