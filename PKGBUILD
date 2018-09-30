# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-fb
pkgname=deadbeef-plugin-fb-gtk3-git
pkgver=r166.g355e614
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/zykure/deadbeef-fb"
license=('GPL2')
depends=('deadbeef-git' 'gtk3')
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
  rm \
    "${pkgdir}/usr/share/doc/deadbeef-fb/LICENSE" \
    "${pkgdir}/usr/share/doc/deadbeef-fb/version"
}
