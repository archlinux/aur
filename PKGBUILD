# $Id: PKGBUILD 308083 2017-10-17 10:28:27Z arojas $
# Maintainer:
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=mono-basic
pkgver=4.6
pkgrel=2
pkgdesc="Mono Visual Basic.NET compiler"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mono-project.com/"
depends=('mono>=4.0.1')
source=(http://download.mono-project.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('303d79f73ae9d6120ef12ebeaf2ec67fda96256801e3bf305c46f8787a751e8f')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${srcdir}/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  # build mono
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

