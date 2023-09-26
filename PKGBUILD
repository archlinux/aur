# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ddb_medialib
pkgname=deadbeef-plugin-medialib-git
pkgver=r108.g0557ac1
pkgrel=2
pkgdesc="DeaDBeeF media library plugin"
arch=('i686' 'x86_64')
url="https://github.com/sgomin/ddb_medialib"
license=('unknown')
depends=('deadbeef' 'gtkmm3' 'boost-libs')
makedepends=('git' 'boost')
source=("${_pkgname}::git+https://github.com/sgomin/${_pkgname}"
        "${_pkgname}-makefile.patch")
sha256sums=('SKIP'
            '38db1362fd3d6117b98b36499f508ac55bf9017f2068ad8cde38bd201f24133e')

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
  CUSTOMFLAGS="-fomit-frame-pointer"
  make COPT="${CUSTOMFLAGS}" CXXOPT="${CUSTOMFLAGS}"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
