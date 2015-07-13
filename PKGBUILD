# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=xtrkcad-hg
pkgver=576.1707c9d938c9
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gtk2' 'webkitgtk2')
optdepends=()
makedepends=('cmake' 'mercurial' 'gettext')
conflicts=('xtrkcad')
provide=('xtrkcad')
replaces=()
backup=()
_hgroot='http://xtrkcad-fork.hg.sourceforge.net:8000/hgroot/xtrkcad-fork'
_hgrepo='xtrkcad'
source=(hg+http://xtrkcad-fork.hg.sourceforge.net:8000/hgroot/xtrkcad-fork/xtrkcad)
sha512sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_hgrepo}
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd ${srcdir}/${_hgrepo}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS="-lm" -DCMAKE_BUILD_TYPE="Release" -DXTRKCAD_USE_GETTEXT="ON"
  make
}

package() {
  cd ${srcdir}/${_hgrepo}
  make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/${_hgrepo}/app/lib/xtrkcad.desktop" "${pkgdir}/usr/share/applications/xtrkcad.desktop"
  install -Dm644 "${srcdir}/${_hgrepo}/app/lib/icon.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}

