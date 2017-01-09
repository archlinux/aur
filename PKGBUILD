# Maintainer: arjan5 <aur@anymore.nl>
# Previous Maintainer: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Original Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>
# Contributor: poisonby <poisonby@tutanota.com>

pkgname=feedreader-beta
pkgver=2.0_beta1
pkgrel=1
pkgdesc='simple feedreader client for web services like Tiny Tiny RSS and others in the future'
arch=('i686' 'x86_64')
url='http://jangernert.github.io/FeedReader/'
license=('GPL3')
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret' 'gnome-keyring' 'libpeas' 'gnome-online-accounts')
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jangernert/FeedReader/archive/v${pkgver//_beta/-beta-}.tar.gz)
sha256sums=('e865e1209a96dff12d370e2224d2671e8f81c4305d725effbf543573a40dee0b')

build() {
  cd "${srcdir}"
  if [[ -d "${srcdir}/build" ]]; then
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build" && cd "${srcdir}/build"
  cmake ../FeedReader-"${pkgver//_beta/-beta-}"/ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et
