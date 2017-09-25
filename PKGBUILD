# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alastair Stuart <alastair@muto.so>

pkgname=cvsps2-git
_pkgname=cvsps
__pkgname=cvsps2
pkgver=2.1
pkgrel=1
pkgdesc="cvsps v2, needed by 'git cvsimport'"
url="http://www.cobite.com/cvsps/"
license=('GPL')
depends=('zlib')
provides=(${_pkgname}=${pkgver} ${__pkgname}=${pkgver})
conflicts=(${_pkgname} ${__pkgname})
replaces=(${__pkgname})
arch=('i686' 'x86_64')
source=("https://github.com/bbidulock/${_pkgname}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "inet_addr-64bit.patch")
md5sums=('bde2110ed9f5d14de8f8cb04e9d596fe'
         '669d2eefca07ef46cafbe3686d616239')

prepare() {
  cd ${_pkgname}-$pkgver
  patch -Np1 -b -z .orig -i ../inet_addr-64bit.patch
}

build() {
  cd ${_pkgname}-$pkgver
  make prefix=/usr
}

package() {
  cd ${_pkgname}-$pkgver
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
