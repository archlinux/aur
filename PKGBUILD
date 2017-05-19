# Maintainer: kaptoxic

pkgname=purple-mattermost-git
pkgver=v1.1.r0.g30cfb74
pkgrel=1
pkgdesc="A purple-based (Pidgin) plugin for Mattermost."
url='https://github.com/EionRobb/purple-mattermost'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git')
depends=('libpurple' 'json-glib' 'discount')
source=('pidgin-mattermost::git+https://github.com/EionRobb/purple-mattermost.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/pidgin-mattermost/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/pidgin-mattermost/"
  make
}

package() {
  cd "$srcdir/pidgin-mattermost/"
  #installing purple plugin
  install -Dm755 libmattermost.so "$pkgdir/usr/lib/purple-2/libmattermost.so"
  #installing icons
  install -Dm644 mattermost16.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/16/mattermost.png"
  install -Dm644 mattermost22.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/22/mattermost.png"
  install -Dm644 mattermost48.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/48/mattermost.png"
}

