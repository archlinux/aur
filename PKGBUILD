pkgname=luabind-rpavlik-git
pkgver=v0.9.r145.ga0edf58
pkgrel=1
provides=('luabind')
pkgdesc="A library that helps you create bindings between C++ and Lua"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
makedepends=('boost' 'boost-build')
depends=('lua' 'gcc-libs')
source=("luabind::git+https://github.com/rpavlik/luabind.git")
md5sums=('SKIP')

pkgver() {
  cd luabind 
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd ${srcdir}/luabind
  bjam
}

package() {
  cd ${srcdir}/luabind
  bjam --prefix=${pkgdir}/usr/ install
  cd ${pkgdir}/usr/lib
  ln -s libluabindd.so libluabind.so
}
