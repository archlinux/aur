# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Maintainer: Jakob Gruber <jakob.gruber@gmail.com>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: rayte <rabyte.at.gmail.dot.com>

pkgname=luabind
pkgver=0.9.1
pkgrel=5
pkgdesc="A library that helps you create bindings between C++ and Lua"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
makedepends=('unzip' 'boost' 'boost-build')
depends=('lua51' 'gcc-libs')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "luabind_boost.patch"
	"boost_1.57.patch")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Np1 -i ${srcdir}/luabind_boost.patch
  patch -Np1 -i ${srcdir}/boost_1.57.patch

  # build luabind
  export LUA_PATH=/usr/include/lua51
  b2 release --prefix=${pkgdir}/usr/ link=static,shared
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  b2 release --prefix=${pkgdir}/usr/ link=static,shared install

  # copy license
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('8a323fb51d07dad5cfdb12c432793d55'
         'd62ae6fc635300bc659df9dbb587ac53'
         '92450a08bc1eed7957109a6c712b1d45')
