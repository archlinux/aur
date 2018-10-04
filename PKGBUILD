# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=xtrkcad-hg
pkgver=r1759.72bc5eacddda
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('webkitgtk2>=2.4.11-12')
makedepends=('cmake' 'mercurial' 'gettext')
conflicts=('xtrkcad')
provides=('xtrkcad')
source=(hg+http://hg.code.sf.net/p/xtrkcad-fork/xtrkcad)
sha512sums=('SKIP')
_hgname='xtrkcad'

pkgver() {
  cd ${_hgname}
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd ${_hgname}
  cmake \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_EXE_LINKER_FLAGS="-lm" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DXTRKCAD_USE_GETTEXT="ON"
  make
}

package() {
  cd ${_hgname}
  make DESTDIR=${pkgdir} install
  install -Dm644 "app/lib/xtrkcad.desktop" "${pkgdir}/usr/share/applications/xtrkcad.desktop"
  install -Dm644 "app/lib/xtrkcad.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}
