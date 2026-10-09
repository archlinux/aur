# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ddb_medialib
pkgname=deadbeef-plugin-medialib-git
pkgver=r108.g0557ac1
pkgrel=3
pkgdesc="DeaDBeeF media library plugin"
arch=('x86_64' 'i686')
url="https://github.com/sgomin/ddb_medialib"
license=('LicenseRef-NoLicense')
depends=('deadbeef'
         'glibc'
         'libgcc'
         'libstdc++'
         'libsigc++'
         'boost-libs'
         'glibmm'
         'gtkmm3'
         'atkmm')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/sgomin/${_pkgname}"
        "${_pkgname}-makefile.patch"
        "LICENSE")
sha256sums=('SKIP'
            'c586c8651f342d2f539cb6de9f4753da5ef982d4b75b2345d64ca24c7e76978f'
            '1d6cbc79f97533a4497791f144206705f7a171e209226708d349c01dc6563041')

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
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dvm0644 "${srcdir}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
