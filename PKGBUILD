# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Felipe Weckx <felipe@weckx.net>

set -u
pkgname='libtelnet'
pkgver='0.23'
pkgrel='1'
pkgdesc='Simple RFC-complient TELNET implementation as a C library.'
arch=('i686' 'x86_64')
url='http://github.com/seanmiddleditch/libtelnet'
license=('custom')
depends=('zlib')
makedepends=('make' 'patch' 'libtool' 'pkg-config' 'autoconf' )
_srcdir="${pkgname}-${pkgver}"
source=(
  "${_srcdir}.tar.gz::https://github.com/seanmiddleditch/libtelnet/archive/${pkgver}.tar.gz"
)
md5sums=('dd84c031f190c11d2db78b6c0c055f8e')
sha256sums=('ef510d32f9131433cc4c8b6789e40087d515a187e55f8fdcd72a975c66d3a90b')

prepare() {
  set -u
  cd "${_srcdir}"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -e 'ltmain.sh' ]; then
    libtoolize --force
  fi
  if [ ! -s 'configure' ]; then
    autoreconf -i
  fi
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr'
  fi
  make
  set +u
}

package(){
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 'COPYING' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
