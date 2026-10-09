# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-fb
pkgname=deadbeef-plugin-fb-gtk3-git
pkgver=r168.g17accd5
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('x86_64' 'i686')
url="https://gitlab.com/zykure/deadbeef-fb"
license=('GPL-2.0-or-later')
depends=('deadbeef'
         'glibc'
         'glib2'
         'gtk3'
         'gdk-pixbuf2'
         'at-spi2-core'
         'hicolor-icon-theme')
makedepends=('git' 'autoconf' 'automake' 'libtool')
source=("${_pkgname}::git+https://gitlab.com/zykure/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  ./autogen.sh
}

build() {
  cd "${_pkgname}"
  CFLAGS="${CFLAGS}" ./configure --prefix=/usr --disable-gtk2
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/doc/deadbeef-fb/"{LICENSE,COPYING,version}
}
