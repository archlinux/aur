# Maintainer: poisonby <poisonby@tutanota.com>
# Contributor: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader
pkgver=2.0
pkgrel=3
pkgdesc='simple feedreader client for web services like Tiny Tiny RSS and others in the future'
arch=('i686' 'x86_64')
url='http://jangernert.github.io/FeedReader/'
license=('GPL3')
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret' 'gnome-keyring' 'rest' 'gnome-online-accounts' 'libpeas' 'libxml2' 'curl' 'gstreamer' 'gst-plugins-base')
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jangernert/FeedReader/archive/v${pkgver}.tar.gz)
sha256sums=('eba631c2c1a644d815accb2234e72d161a9f45383c19d57c4fdda9ff1ee75135')

build() {
  cd "${srcdir}"
  if [[ -d "${srcdir}/build" ]]; then
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build" && cd "${srcdir}/build"
  cmake ../FeedReader-"${pkgver}"/ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et
