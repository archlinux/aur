# Maintainer: Emersion <http://emersion.fr> 
# Contributor: Erasmo Marín <https://code.launchpad.net/~erasmo-marin>

pkgname=webby-browser-bzr
pkgver=r9
pkgrel=1
pkgdesc='A webapp browser.'
arch=('i686' 'x86_64')
url='https://code.launchpad.net/~erasmo-marin/webby-browser'
license=('MIT')
depends=('glib2' 'gtk3' 'granite' 'libgee' 'webkit2gtk' 'libsoup')
makedepends=('vala' 'gobject-introspection' 'cmake' 'bzr')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('bzr+lp:webby-browser')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}

  if [[ -d build ]]; then
    rm -rf build
  fi

  sed -i "s|webkit2gtk-3.0|webkit2gtk-4.0|g" CMakeLists.txt
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}
