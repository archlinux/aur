# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader-bzr
pkgver=r248
pkgrel=1
pkgdesc='A simple feedreader client for web services like Tiny Tiny RSS and in the future others.'
arch=('i686' 'x86_64')
url='https://launchpad.net/feedreader'
license=('GPL3')
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libunity' 'libnotify' 'html2text-with-utf8' 'libsoup' 'json-glib' 'libsecret')
makedepends=('vala' 'gobject-introspection' 'cmake' 'bzr')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('bzr+lp:feedreader')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}
  find . -type f -exec sed -i 's/webkit2gtk-3.0/webkit2gtk-4.0/' {} \;
  find . -type f -exec sed -i 's/WebKit2-3.0/WebKit2-4.0/' {} \;

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  #make -j(threads)
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et
