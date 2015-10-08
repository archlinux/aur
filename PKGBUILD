# Maintainer: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Original Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader-beta
pkgver=1.4
pkgrel=1
pkgdesc='A simple feedreader client for web services like Tiny Tiny RSS and in the future others.'
arch=('i686' 'x86_64')
url='https://launchpad.net/feedreader'
license=('GPL3')
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'html2text-with-utf8' 'libsoup' 'libgee' 'json-glib' 'libsecret' 'libxml2' 'rest')
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('https://launchpad.net/feedreader/'${pkgver}'/'${pkgver}'-beta/+download/FeedReader-'${pkgver}'-beta.tar.gz')
sha256sums=('1b6db6d28273e8bd9295ef2773b0a8dcfac6532230bcc3fdef91eccf53690ca5')

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
