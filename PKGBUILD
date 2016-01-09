# Maintainer: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader
pkgver=1.4.3
pkgrel=1
pkgdesc='A simple feedreader client for web services like Tiny Tiny RSS and in the future others.'
arch=('i686' 'x86_64')
url='https://launchpad.net/feedreader'
license=('GPL3')
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret')
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('https://launchpad.net/feedreader/'${pkgver%.*}'/'${pkgver}'/+download/FeedReader-'${pkgver}'.tar.gz')
sha256sums=('e43ceb9eb866c2e8e16d460b6914e6450b2c97fe62f0730a2ec67a3c7d7f0a3c')

pkgver() {
  cd "${srcdir}"
}

##Build without Libunity (-DWITH_LIBUNITY=OFF)
build() {
  cd "${srcdir}"
  if [[ -d "${srcdir}/build" ]]; then
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build" && cd "${srcdir}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_WEBKIT_4=ON -DWITH_LIBUNITY=OFF ..
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et
