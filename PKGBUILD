# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=json-spirit
pkgver=4.18
pkgrel=1
pkgdesc="JSON Spirit is a C++ JSON library using Boost Spirit for parsing."
arch=('x86_64')
url="https://github.com/infinitio/json-spirit"
license=('MIT')
depends=()
makedepends=('cmake')
source=('https://github.com/madmongo1/json_spirit/archive/master.zip')
sha256sums=('3869b469debf40e789d11305347c1de63c13ca1ff472d5e4b119eca76bf1ae95')

prepare(){
  rm -rf "$srcdir/build"
  mkdir -p "$srcdir/build"
}
build() {
	cd "$srcdir/build"
  export CXX=/usr/bin/clang++
  export CC=/usr/bin/clang
   cmake ../json_spirit-master \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
