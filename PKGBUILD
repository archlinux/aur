# $Id: PKGBUILD,v 1.2 2008/03/27 20:03:15 daniel Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=mono-addins
pkgver=0.3.1
pkgrel=2
pkgdesc="a generic framework for creating extensible applications and for creating libraries which extend those applications"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Mono.Addins"
license=('custom:MIT')
depends=('gtk-sharp-2>=2.12.0')
makedepends=('pkgconfig')
source=(http://go-mono.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('bae5e01ba61bd261de2335ab0dfe999f')

build() {
  export MONO_SHARED_DIR="${startdir}/src/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --enable-gui
  make || return 1
  make GACUTIL="/usr/bin/gacutil -root $startdir/pkg/usr/lib"  DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/ || return 1
}
