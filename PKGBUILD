# Maintainer: Maria Lisina <sekoohaka.sarisan@gmail.com>

pkgname=telegram-bot-api
pkgver=7.7
pkgrel=1
_commit=9112a6b5359fe5bf71371a43cc1cb08f648ba377
_td_commit=cb164927417f22811c74cd8678ed4a5ab7cb80ba
pkgdesc="Telegram Bot API server"
arch=('x86_64')
url="https://core.telegram.org/bots"
license=('BSL-1.0')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cmake>=3.0.2' 'gcc>=4.9.2' 'git' 'gperf')
provides=('telegram-bot-api')
conflicts=('telegram-bot-api-git')
source=("git+https://github.com/tdlib/telegram-bot-api.git#commit=$_commit"
        "git+https://github.com/tdlib/td.git#commit=$_td_commit")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd telegram-bot-api

  git submodule init
  git config submodule.td.url ../td
  git -c protocol.file.allow=always submodule update
}

build() {
  cd telegram-bot-api

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd telegram-bot-api

  DESTDIR="$pkgdir" cmake --install build
}
