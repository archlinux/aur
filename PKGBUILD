#
# Maintainer: Bastian Rieck <bastian@rieck.ru>
#

pkgname=aleph-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r1578.2822abb
pkgrel=1
pkgdesc='A library for exploring persistent homology'
arch=('x86_64')
url="http://submanifold.github.io/Aleph"
license=('MIT')
groups=()
depends=('boost')
makedepends=('git' 'cmake')
optdepends=('flann: Support for fast approximate nearest neighbour search'
            'rapidjson: Support for JSON input and output')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('aleph::git+https://github.com/Submanifold/Aleph.git')
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
	make -k test
}

package() {
	cd "$srcdir/${pkgname%-git}"
  cd build
	make DESTDIR="$pkgdir/" install
}
