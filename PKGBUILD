# Maintainer: Kujiu <kujiu+arch@kujiu.org>

pkgname=bitlbee-mastodon-git
pkgrel=1
pkgver=r8.ff9e4fd
pkgdesc='Mastodon protocol plugin for BitlBee'
arch=('i686' 'x86_64')
url='https://github.com/kensanata/bitlbee-mastodon'
license=('GPL2')
depends=('bitlbee' 'glib2')
makedepends=('git' 'autoconf' 'automake' 'gcc')
conflicts=('bitlbee-mastodon')

source=("git+https://github.com/kensanata/${pkgname%-git}.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh --prefix=/usr
  ./configure
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
