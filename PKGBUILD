# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Maintainer: Jakob Gruber <jakob.gruber@gmail.com>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: rayte <rabyte.at.gmail.dot.com>

pkgname=luabind
pkgver=0.9.1
pkgrel=6
pkgdesc="A library that helps you create bindings between C++ and Lua"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
makedepends=('unzip' 'boost' 'boost-build')
depends=('lua' 'gcc-libs')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "luabind_boost.patch"
	      "boost_1.57.patch")

sha256sums=('80de5e04918678dd8e6dac3b22a34b3247f74bf744c719bae21faaa49649aaae'
            '010026c1446b276e9e04f11851aca90c5172841cf421c3a31aef4ab442c80d7e'
            '4d88455c7a1d5fe2356da07b1d008bdcfc82492a47dae8adefeb588939d3d714')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Np1 -i ${srcdir}/luabind_boost.patch
  patch -Np1 -i ${srcdir}/boost_1.57.patch

  # build luabind
  # export LUA_PATH=/usr/include/lua51
  # export LUA_PATH=/usr/include/lua52
  b2 release --prefix=${pkgdir}/usr/ link=static,shared
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  b2 release --prefix=${pkgdir}/usr/ link=static,shared install

  # copy license
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
