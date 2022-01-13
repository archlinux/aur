#
# Maintainer: Bastian Rieck <bastian@rieck.me>
#

pkgname=dipha-git
pkgver=r129.6a60427
pkgrel=1
pkgdesc='A Distributed Persistent Homology Algorithm (BorgwardtLab fork)'
arch=('x86_64')
url="https://github.com/BorgwardtLab/DIPHA"
license=('LGPL')
groups=()
depends=('boost' 'openmpi')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('dipha::git+https://github.com/BorgwardtLab/DIPHA')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make -j8
}

check() {
	cd "$srcdir/${pkgname%-git}"
  cd build
  # Just pretend that building the package is enough.
  make -j8
}

package() {
	cd "$srcdir/${pkgname%-git}"
  cd build
	make DESTDIR="$pkgdir/" install
}
