# Maintainer: Grigorii Horos <horosgrisa@gmail.com>
pkgname=feedreader-git
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple feedreader client for web services like Tiny Tiny RSS and in the future others."
arch=('i686' 'x86_64')
url="https://launchpad.net/feedreader"
license=('GPL3')
groups=()
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret' 'libunity')
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=(${pkgname%-*})
install="${pkgname%-*}.install"
source=('git+https://github.com/jangernert/FeedReader.git')
sha256sums=('SKIP')


build() {
  mkdir -p "$srcdir/FeedReader/build"
  cd "$srcdir/FeedReader/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_WEBKIT_4=ON ..
  make
}

package() {
  cd "$srcdir/FeedReader/build"
  make DESTDIR="${pkgdir}" install
}
