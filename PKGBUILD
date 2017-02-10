# Maintainer: Michael Herold <arch@michaeljherold.com>
# Contributor: Rasmus Steinke <rasi at xssn dot at>
# Contributor: Rafael Bodill <justrafi[at]gmail[dot]com>

pkgname=mpdcron-git
_gitname=mpdcron
pkgver=v0.3.55.ge49e604
pkgrel=1
pkgdesc="A 'cron' like program for mpd. It can execute scripts based on mpd's idle events"
arch=('i686' 'x86_64')
url="http://alip.github.io/mpdcron/"
license=('GPL')
provides=('mpdcron' 'eugene' 'homescrape' 'walrus')
depends=('libmpdclient>=2.1' 'libdaemon' 'glib2' 'curl' 'sqlite3')
makedepends=('git' 'gcc' 'make' 'autoconf')
options=('!libtool')
source=('git+git://github.com/alip/mpdcron.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --enable-gmodule --with-standard-modules=all
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
