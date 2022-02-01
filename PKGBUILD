# Maintainer: Sarisan Sekoohaka <sekoohaka.sarisan@gmail.com>

pkgname=telegram-bot-api
pkgver=5.7
pkgrel=1
pkgdesc="Telegram Bot API server"
arch=('x86_64')
url="https://core.telegram.org/bots"
license=('BSL-1.0')
depends=('openssl' 'zlib' 'gcc-libs')
makedepends=('git' 'gcc>=4.9' 'gperf' 'cmake>=3.0.2')
provides=('telegram-bot-api')
conflicts=('telegram-bot-api-git')
_commit=c57b04c4c8c4e8d8bb6fdd0bd3bfb5b93b9d8f05
_commit1=92c2a9c4e521df720abeaa9872e1c2b797d5c93f
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
