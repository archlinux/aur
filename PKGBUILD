# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=mono-addins
pkgver=1.1
pkgrel=1
pkgdesc="A generic framework for creating extensible applications and for creating libraries which extend those applications"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Mono.Addins"
license=('custom:MIT')
depends=('gtk-sharp-2>=2.12.8' 'mono>=3.4.0')
makedepends=('pkgconfig')
source=(https://github.com/mono/mono-addins/archive/${pkgname}-${pkgver}.tar.gz)
md5sums=('bbacbb5243b00ea7e12b7fd9b4d0b6f5')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --enable-gui
  make
} 

package() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  make GACUTIL="/usr/bin/gacutil -root ${pkgdir}/usr/lib"  DESTDIR=${pkgdir} install

  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
