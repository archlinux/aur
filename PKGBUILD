# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jay Garcia <morbidj at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Robert Orzanna <orschiro at gmail dot com>

set -u

#_ubver='1.7.2~174~ubuntu14.04.1'; _libgee='libgee06' # This won't build with vala=0.12 or vala=0.28.0
#_ubver='1.7.3~177~ubuntu15.10.1' # not found
#_ubver='1.7.3~177~ubuntu15.04.1' # not found
#_ubver='1.7.3~177~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
_ubver='1.7.5~180~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
pkgname='timeshift'
pkgver="${_ubver%~*}"
pkgrel='1'
_srcdir="${pkgname}_${_ubver}"
pkgdesc='A system restore utility for Linux'
arch=('i686' 'x86_64')
url='https://launchpad.net/~teejee2008/+archive/ubuntu/ppa'
license=('GPL')
_arch_depends=('rsync' 'libgee06' 'json-glib') # from installer/install.sh
_arch_depends[1]="${_libgee}"
depends=('gtk3' 'libsoup' 'desktop-file-utils' "${_arch_depends[@]}")
optdepends=('gksu: run timeshift from a menu')
makedepends=('vala')
options=('!emptydirs')
install="${pkgname}.install"
source=("${url}/+files/${_srcdir}.tar.gz")
sha256sums=('b7c411ce6677e19d7c2114565c820f3c0eab8dc26e151367c28f87c51da66027')

build() {
  set -u
  cd "${srcdir}/${_srcdir//_/-}"

  make -s
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_srcdir//_/-}"

  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
