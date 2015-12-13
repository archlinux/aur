# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=liblomse
pkgver=0.16.1
pkgrel=3
pkgdesc="A music score renderization/edition library"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/lomse/intro"
license=('custom:BSD 2-clause')
groups=('devel')
depends=('freetype2>=2.3.5' 'boost-libs>=1.42')
makedepends=('bzr' 'cmake>=2.8' 'unittestpp' 'boost>=1.42')
_vcsname=lomse

source=("bzr+lp:${_vcsname}#revision=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release "../$_vcsname"

  make
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}/" make install

  install -D -m644 "${srcdir}/${_vcsname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
