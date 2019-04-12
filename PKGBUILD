# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=ddisasm
pkgname=ddisasm-git
pkgver=v0.1.0.r0.gc2744b8
pkgrel=1
pkgdesc="A fast and accurate disassembler"
arch=('x86_64')
url="https://github.com/grammatech/ddisasm"
license=('aGPLv3')
depends=()
makedepends=('git' 'cmake' 'souffle-git' 'mcpp' 'gtirb' 'capstone')
provides=('ddisasm')
source=('git://github.com/grammatech/ddisasm.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    # CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
    CFLAGS="" CXXFLAGS="" LDFLAGS="" cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
  cd "$_srcname/build"
  make DESTDIR="$pkgdir" install
}
