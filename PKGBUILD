# Maintainer: Grigorii Horos <horosgrisa@gmail.com>
pkgname=feedreader-git
pkgver=1.5
pkgrel=5
pkgdesc="FeedReader is a modern desktop application designed to complement existing web-based RSS accounts."
arch=('i686' 'x86_64')
url="https://github.com/jangernert/FeedReader"
license=('GPL3')
groups=()
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret' )
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('git+https://github.com/jangernert/FeedReader.git')
sha256sums=('SKIP')


build() {
  mkdir -p "$srcdir/FeedReader/build"
  cd "$srcdir/FeedReader/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_WEBKIT_4=ON -DWITH_LIBUNITY=OFF ..
  make
}

package() {
  cd "$srcdir/FeedReader/build"
  make DESTDIR="${pkgdir}" install
}
