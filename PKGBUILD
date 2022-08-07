# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>

_gitname=pvr.iptvsimple
pkgname=kodi-addon-pvr-iptvsimple-git
pkgver=r712.6447c58
pkgrel=1
pkgdesc="Kodi's IPTV Simple client addon."
url='https://github.com/kodi-pvr/pvr.iptvsimple'
license=('GPL3')
source=("${_gitname}::git+https://github.com/kodi-pvr/pvr.iptvsimple#branch=Matrix")
sha256sums=('SKIP')
arch=('any')
depends=('kodi' 'p8-platform')
makedepends=('git' 'cmake' 'kodi-platform' 'kodi-dev' 'pugixml')
conflicts=('kodi-addon-pvr-iptvsimple' 'kodi-pvr-addons')
provides=('kodi-addon-pvr-iptvsimple')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
    -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd "${srcdir}/${_gitname}"
  make -j$(getconf _NPROCESSORS_ONLN) prefix=/usr DESTDIR="$pkgdir" install
}
