pkgname=purple-mattermost-spectrum2
pkgver=v1.2.r1.daf5d6b
pkgver() {
  cd "$srcdir"/purple-mattermost-p5n.git
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
pkgrel=1
pkgdesc="A purple-based (Pidgin) plugin for Mattermost. (spectrum2 work)"
url='https://github.com/p5n/purple-mattermost'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git')
options=(!strip)
depends=('libpurple' 'json-glib' 'discount')
source=("purple-mattermost-p5n.git::git://github.com/p5n/purple-mattermost.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/purple-mattermost-p5n.git
  make
}

package() {
  cd "$srcdir"/purple-mattermost-p5n.git
  #installing purple plugin
  install -Dm755 libmattermost.so "$pkgdir/usr/lib/purple-2/libmattermost.so"
  #installing icons
  install -Dm644 mattermost16.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/16/mattermost.png"
  install -Dm644 mattermost22.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/22/mattermost.png"
  install -Dm644 mattermost48.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/48/mattermost.png"
}
