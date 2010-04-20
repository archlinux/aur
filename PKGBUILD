# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=mono-addins
pkgver=0.4
pkgrel=4
pkgdesc="a generic framework for creating extensible applications and for creating libraries which extend those applications"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Mono.Addins"
license=('custom:MIT')
depends=('gtk-sharp-2>=2.12.8' 'mono>=2.4.2')
makedepends=('pkgconfig')
source=(http://ftp.novell.com/pub/mono/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3b7f3f6e55c95413df184d0e4c9233e4')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --enable-gui || return 1
  make || return 1
  make GACUTIL="/usr/bin/gacutil -root ${pkgdir}/usr/lib"  DESTDIR=${pkgdir} install || return 1

  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
}
