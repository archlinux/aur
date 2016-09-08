# Maintainer: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader
pkgver=1.6.2
pkgrel=1
pkgdesc='simple feedreader client for web services like Tiny Tiny RSS and others in the future'
arch=('i686' 'x86_64')
url='https://launchpad.net/feedreader'
license=('GPL3')
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret')
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jangernert/FeedReader/archive/v${pkgver}.tar.gz)
sha256sums=('c9ddb59d14a2cb04d00db07fcd90f3de07f9ae1f2fb0f21783db8e9a242991ed')

build() {
  cd "${srcdir}"
  if [[ -d "${srcdir}/build" ]]; then
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build" && cd "${srcdir}/build"
  cmake ../FeedReader-"${pkgver}"/ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et
