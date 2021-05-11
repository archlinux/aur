# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=gtirb
pkgname=gtirb-git
pkgver=v1.10.4.r56.g79785d10
pkgrel=1
pkgdesc="GrammaTech Intermediate Representation for Binaries"
arch=('x86_64')
url="https://github.com/grammatech/gtirb"
license=('MIT')
depends=('protobuf')
makedepends=('git' 'cmake' 'python' 'doxygen' 'graphviz' 'boost')
provides=('gtirb')
source=('git+https://github.com/grammatech/gtirb.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DGTIRB_CL_API=OFF
    cmake --build build --target all doc
}

package() {
  cd "$_srcname/"
  make -Cbuild DESTDIR="$pkgdir" install install-python
  mkdir -p "$pkgdir"/usr/share/doc/$_srcname
  cp -R build/doc/html/ "$pkgdir"/usr/share/doc/$_srcname
}
