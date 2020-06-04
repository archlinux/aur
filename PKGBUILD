# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=zdkimfilter
pkgver=2.1
pkgrel=4
pkgdesc="zDKIM filter for Courier-MTA using the OpenDKIM Project's library."
arch=('i686' 'pentium4' 'x86_64')
url='https://www.tana.it/sw/zdkimfilter/'
license=('GPL3')
depends=(
  'courier-mta'
)
_pinned_dependencies=(
  'glibc>=2.31'
  'libidn2=2.3.0'
  'libunistring=0.9.10'
  'libutil-linux=2.35.2'
  'nettle=3.6'
  'opendbx=1.4.6'
  'opendkim=2.10.3'
  'zlib=1:1.2.11'
)
backup=('etc/courier/filters/zdkimfilter.conf')
source=(
  "http://www.tana.it/sw/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
)
sha512sums=('493a53d0879c7516196df32e364bf94d4f7f5265095637417ca9e569145dea68e528debe93f0835ffac493f05ab38d2b4cbd2bcd7da8029f5a9ef98a488d058d'
            'SKIP')
validpgpkeys=('0A5B4BB141A53F7F55FC8CBCB6ACF44490D17C00')
options=('debug' '!strip')

build() {

  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-courier-version=60
  make

}

package() {

  depends+=("${_pinned_dependencies[@]}")

  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mv "${pkgdir}/etc/courier/filters/zdkimfilter.conf"{.dist,}

}
