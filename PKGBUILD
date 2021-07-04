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
source=('git+https://github.com/smartnode/telebot'
        'patch')
b2sums=('SKIP'
        '334d61c9233b80e3f861d1500420beaaf924a80a8c8dae025fc65d6ee9ddcced553add389c6c863d76262b6c5f4b108b7e102699b083384cb504bda069c0f707')

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
