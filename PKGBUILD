# Maintainer: a821 at (nospam) mail de
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=lrzip-git
pkgver=0.651.r12.g15f5621
pkgrel=1
pkgdesc="Multi-threaded compression with rzip/lzma, lzo, and zpaq"
arch=( 'x86_64' )
url="https://github.com/ckolivas/lrzip"
license=('GPL-2.0-or-later')
depends=('bash' 'bzip2' 'lz4' 'lzo' 'zlib')
makedepends=('git' 'perl')
conflicts=( 'lrzip' )
provides=( 'lrzip' )
_pkgname=lrzip
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  CFLAGS="${CFLAGS} -fomit-frame-pointer"
  CXXFLAGS="${CXXFLAGS} -fomit-frame-pointer"

  ./autogen.sh --prefix=/usr --disable-doc
  make
}

check() {
  make -C "${_pkgname}" -k check
}

package() {
  make -C "${_pkgname}" DESTDIR="${pkgdir}" install-strip
}
