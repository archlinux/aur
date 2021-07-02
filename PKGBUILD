# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname=telebot-git
pkgver=r130.470994b
pkgrel=1
pkgdesc='Telegram Bot API in C'
arch=('any')
url='https://elmurod.net/telebot/'
license=('Apache')
depends=('json-c' 'curl')
makedepends=('cmake')
source=('git+https://github.com/smartnode/telebot')
b2sums=('SKIP')

pkgver() {
  cd "telebot"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/telebot"
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
