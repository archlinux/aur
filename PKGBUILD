# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=mono-addins
pkgver=0.6.2
pkgrel=3
pkgdesc="A generic framework for creating extensible applications and for creating libraries which extend those applications"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Mono.Addins"
license=('custom:MIT')
depends=('gtk-sharp-2>=2.12.8' 'mono>=2.10.5')
makedepends=('pkgconfig')
source=(http://download.mono-project.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('afbbe5e9fdf9b03911bc8e6b94feb60b')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-gui
  make
} 

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make GACUTIL="/usr/bin/gacutil -root ${pkgdir}/usr/lib"  DESTDIR=${pkgdir} install

  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
