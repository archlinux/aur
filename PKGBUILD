# Maintainer: Sarisan Sekoohaka <sekoohaka.sarisan@gmail.com>

pkgname=telegram-bot-api
pkgver=6.0.2
pkgrel=1
pkgdesc="Telegram Bot API server"
arch=('x86_64')
url="https://core.telegram.org/bots"
license=('Boost')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cmake>=3.0.2' 'gcc>=4.9.2' 'git' 'gperf')
provides=('telegram-bot-api')
conflicts=('telegram-bot-api-git')
_commit=8a0f1dd730aa41ab7b792b9ff03d92b1c5022c9f
_commit1=ab3a8282d4ee307d341071267ef1090b1a941478
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
  cmake -S telegram-bot-api -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr"
  cmake --build build
}

package() {
  cmake --build build --target install
}
