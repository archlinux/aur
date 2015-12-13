# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
_pkgver=5.4
pkgver=${_pkgver}.0
pkgrel=5
_pkgcommit=723
pkgdesc="A free program to learn music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/phonascus/intro"
license=('GPL')
depends=('portmidi' 'wxgtk' 'sqlite3' 'boost-libs')
optdepends=('timidity++: for sound without external midi player')
makedepends=('boost' 'unittestpp' 'cmake>=2.8')

source=("https://launchpad.net/${pkgname}/trunk/${_pkgver}/+download/${pkgname}-${pkgver}-${_pkgcommit}.tar.gz"
        'cmake-boost.patch'
	'cmake-find.patch'
	'cmake-freetype.patch'
	'cmake-wxgtk.patch')
md5sums=('f8a033fb566fb1bd9b2b2bfecddf06fe'
         '2deed1b6d5fb615a88c849fa5db671c1'
         '4dfbbbf1a1a34ff8d53767a5f2744ee7'
         'c406113341ec3f5bdc87573a62d1954b'
         '923d4c27a992d5a9c0590e3529665a57')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd "$srcdir"
  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${pkgver}/"

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
