# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: poisonby <poisonby@tutanota.com>
# Contributor: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader
pkgver=2.0.2
pkgrel=1
pkgdesc="FeedReader is a modern desktop application designed to complement existing web-based RSS accounts."
arch=('i686' 'x86_64')
url="https://github.com/jangernert/FeedReader"
license=('GPL3')
conflicts=("$pkgname-git")
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret' 'libpeas' 'gnome-online-accounts' 'curl')
makedepends=('vala' 'gobject-introspection' 'cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('949262912bc07f8d1ec72dfa1bbeafb0ed1cea992589e1ee5901e0630c714261')

build() {
  cd FeedReader-$pkgver

  mkdir build
  cd build

  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DGSETTINGS_COMPILE=OFF \
	  -DCMAKE_INSTALL_LIBDIR=lib \
	  ..
  make
}

package() {
  cd FeedReader-$pkgver/build

  make DESTDIR=$pkgdir install
}
