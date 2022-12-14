# Maintainer: EndlessEden <eden.rose@deep-rose.org>
#
# Original Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=talkatu
pkgname=$_pkgname-hg
pkgver=1.0.r491.ad000db4fe9a
pkgrel=1
pkgdesc="Gtk+ widgets for chat software"
arch=('i686' 'x86_64')
url="https://keep.imfreedom.org/talkatu/talkatu"
license=('GPL2')
depends=('gtk3>=3.10.0' 'glade>=2.0' 'gumbo-parser>=0.10' 'gspell>=1.2' 'cmark')
makedepends=('mercurial' 'meson' 'vala' 'help2man' 'gtk-doc' 'gobject-introspection')
source=("$pkgname::hg+https://keep.imfreedom.org/$_pkgname/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.0.r%s.%s" \
    "$(hg identify -n)" \
    "$(hg identify -i)"
}

build() {
  cd "${pkgname}"
  arch-meson build -Dtests=false
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  mv ${pkgdir}/usr/include/talkatu-1.0/ ${pkgdir}/usr/include/talkatu
}
