# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=tt-rss-feedmod
_gitname=ttrss_plugin-af_feedmod
pkgver=f668480
pkgrel=2
pkgdesc="Article Filter plugin for Tiny-Tiny-RSS to replace article stubs by website contents"
arch=('any')
url="https://github.com/mbirth/ttrss_plugin-af_feedmod"
license=('GPL2')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-feedmod')
conflicts=('tt-rss-feedmod')
source=('git+https://github.com/mbirth/ttrss_plugin-af_feedmod'
        'type_replace.patch')
sha1sums=('SKIP'
          '9731c145802878379815ca16b57a4084435d3b88')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir"
  patch -p1 < type_replace.patch
}

package() {
  cd "$srcdir"
  install -d -m755 "$pkgdir/usr/share/webapps/tt-rss/plugins/af_feedmod/"
  install -D -m644  ttrss_plugin-af_feedmod/init.php "$pkgdir/usr/share/webapps/tt-rss/plugins/af_feedmod/"
}
