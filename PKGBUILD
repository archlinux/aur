# Maintainer: Kridsada Thanabulpong <sirn@ogsite.net>
_pkgname="ibus-libthai"
pkgname="ibus-libthai-svn"
pkgver=0.1.3.r50
pkgrel=2
pkgdesc="IBus engine module for LibThai"
url="http://linux.thai.net/websvn/wsvn/software.ibus-libthai"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('ibus' 'libthai')
optdepends=()
makedepends=()
conflicts=('ibus-libthai')
replaces=('ibus-libthai')
provides=("${_pkgname}=${pkgver}")
backup=()
install=
source=("${_pkgname}::svn+http://linux.thai.net/svn/software/${_pkgname}/trunk")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "${_pkgname}"
  local localver="$(cat NEWS |grep Version |cut -d' ' -f 2 |head -n1)"
  local svnver="$(svnversion)"
  printf "%s.r%s" "${localver}" "${svnver//[[:alpha:]]}"
}
