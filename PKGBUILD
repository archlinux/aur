# Maintainer: dreieck

_pkgname=statifier
pkgname="${_pkgname}"
_pkgver=1.7.4
# epoch=0
pkgver="${_pkgver}"
pkgrel=3
pkgdesc="Create portable, self-containing Linux executables: Creates from dynamically linked executables and all it's libraries one file. Note: Does not play well with VDSO, which most modern kernels have activated."
arch=('i386' 'i486' 'i586' 'i686' 'x86_64')
url="http://statifier.sourceforge.net/"
license=('GPL2')

depends=(
  'glibc'
)

depends_x86_64=(
  'lib32-glibc'
)

provides=(
)
replaces=(
)
conflicts=(
)

backup=(
)

# install="${_pkgname}.install"

source=(
  "statifier-${_pkgver}.tar.gz::https://sourceforge.net/projects/statifier/files/statifier/${_pkgver}/statifier-${_pkgver}.tar.gz/download"
)

sha256sums=(
  "c8a758ee1f3604d1c6fa755e2422ac4e741008536c9065508050da69149d9f0e"
)

# pkgver() {
#   _unpackeddir="${srcdir}/${_pkgname}-${_pkgver}"
#   cat "${_unpackeddir}/VERSION"
# }

build() {
  _unpackeddir="${srcdir}/${_pkgname}-${_pkgver}"
  cd "${_unpackeddir}"

  make
}

package() {
  _unpackeddir="${srcdir}/${_pkgname}-${_pkgver}"
  cd "${_unpackeddir}"

  make DESTDIR="${pkgdir}" install
  
  _docdir="${pkgdir}/usr/share/doc/${_pkgname}"
  
  for _doc in AUTHORS ChangeLog FAQ INSTALL LICENSE NEWS README RELEASE THANKS TODO VERSION; do
    install -Dpv -m 644 "${_unpackeddir}/${_doc}" "${_docdir}/general/${_doc}"
  done
  
  install -dv -m 755 "${_docdir}/detailed/"
  cp -av "${_unpackeddir}/doc"/* "${_docdir}/detailed/"
}
