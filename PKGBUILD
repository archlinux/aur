# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Maintainer: Nicholas Wang <me@nicho1as.wang>

pkgname=telebot-git
pkgver=r133.6cff657
pkgrel=2
pkgdesc='Telegram Bot API in C'
arch=('any')
url='https://elmurod.net/telebot/'
license=('Apache')
depends=('json-c' 'curl')
makedepends=('cmake')
source=('git+https://github.com/smartnode/telebot'
        'patch')
b2sums=('SKIP'
        'b3ad5aaa931cbeaf03a829f5d5c51d139c73aa3b659bf5a01d5c2689d5f27c5d77fffb5ad2f323193b6953e5fc8e62529c726ff94c84ebbda540debcdce2ff67')

pkgver() {
  cd "telebot"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/telebot"
  patch --forward --strip=1 --input="$srcdir/patch"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
  cd "$srcdir/telebot"
  make
}

package() {
  cd "$srcdir/telebot"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
