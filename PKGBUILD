# Maintainer: chux0519 <chuxdesign@hotmail.com>
pkgname=pegasocks-git
pkgver=0.0.0r02f19cd
pkgrel=1
epoch=
pkgdesc="A lightweight proxy client written in C, intends to support multiple protocols(trojan etc.) "
arch=("x86_64" "i686")
url="https://github.com/chux0519/pegasocks.git"
license=('BSD 3-Clause')
groups=()
depends=("openssl>=1.1.1" "libevent" "jemalloc" "pcre")
makedepends=("git" "cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
  cd pegasocks
  printf "0.0.0r%s" "$(git rev-parse --short HEAD)"
}

build() {
	cd pegasocks
  git submodule update --init
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DWITH_ACL=ON -DUSE_JEMALLOC=ON ..
  make
}

package() {
	cd pegasocks/build
	make DESTDIR="$pkgdir/" install
}
