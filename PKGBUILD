pkgname=libcsptr-git
pkgver=v2.0.1.r0.gff405f2
pkgrel=1
pkgdesc="A smart pointers library for the C programming language"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/libcsptr.git"
license=('MIT')
makedepends=('git' 'cmake')
provides=('libcsptr')
conflicts=('libcsptr')

source=("$pkgname"::"git://github.com/Snaipe/libcsptr.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
  mkdir -p "build"
  cd "build"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/${pkgname}/build
  make DESTDIR="$pkgdir/" install
}
