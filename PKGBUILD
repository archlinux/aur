# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=deadbeef-lyricsbar
pkgname=deadbeef-plugin-lyricsbar-git
pkgver=r9.gb6709b7
pkgrel=1
pkgdesc="DeaDBeeF lyrics bar plugin"
arch=('i686' 'x86_64')
url="https://github.com/VolkMilit/deadbeef-lyricsbar"
license=('GPL2')
depends=('deadbeef-git')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/VolkMilit/${_pkgname}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '5f8367de9b26c02904c7954d317cd167adc8583826178e481aed7c636415631f')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # Arch compile FLAGS
  patch -p1 -i ../${_pkgname}-makefile.patch
}

build() {
  cd "${_pkgname}"
  make COPTS="${CFLAGS}"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
