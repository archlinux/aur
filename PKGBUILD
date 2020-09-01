# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=zdkimfilter
pkgver=2.2
pkgrel=1
pkgdesc="zDKIM filter for Courier-MTA using the OpenDKIM Project's library."
arch=('i686' 'pentium4' 'x86_64')
url='https://www.tana.it/sw/zdkimfilter/'
license=('GPL3')
_pinned_dependencies=(
  'glibc>=2.31'
  'libidn2.so=0'
  'libnettle.so=8'
  'libunistring=0.9.10'
  'libuuid.so=1'
  'opendbx=1.4.6'
  'opendkim=2.10.3'
  'zlib=1:1.2.11'
)
depends=(
  'courier-mta'
  "${_pinned_dependencies[@]}"
)
backup=('etc/courier/filters/zdkimfilter.conf')
source=(
  "http://www.tana.it/sw/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
)
sha512sums=('3a258f67ace9542dbc150ad1e89791fd50885c9e2599fffeb84b85460a56b3b3541f62779d374366b405274f92d5fa518d8e4c758e82a8a7dfac8a94fb0c6d91'
            'SKIP')
validpgpkeys=('0A5B4BB141A53F7F55FC8CBCB6ACF44490D17C00')
options=('debug' '!strip')

build() {

  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-courier-version=60
  make

}

package() {

  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mv "${pkgdir}/etc/courier/filters/zdkimfilter.conf"{.dist,}

}
