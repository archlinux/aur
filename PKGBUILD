pkgname=luabind-ryzom
pkgver=v0.9.1.r414.gbbb9f40
pkgrel=1
provides=('luabind')
pkgdesc="A library that helps you create bindings between C++ and Lua"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
makedepends=('boost' 'cmake')
depends=('lua' 'gcc-libs')
source=("luabind::git+https://github.com/ryzom/luabind.git")
md5sums=('SKIP')

pkgver() {
  cd luabind 
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  mkdir ${srcdir}/luabind/build
  cd ${srcdir}/luabind/build
  cmake -DLUABIND_DYNAMIC_LINK=ON -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd ${srcdir}/luabind/build
  make DESTDIR="$pkgdir/" install
  cd ${pkgdir}/usr/lib
  ln -s libluabind09.so libluabind.so
}
