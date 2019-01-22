# Maintainer: Kujiu <kujiu+arch@kujiu.org>

pkgname=bitlbee-mastodon-git
pkgrel=2
pkgver=r151.cf2c48a
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
  mkdir -p "$pkgdir/usr/share/bitlbee"
  cp "doc/mastodon-help.txt" "$pkgdir/usr/share/bitlbee"
}

# vim:set ts=2 sw=2 et:
