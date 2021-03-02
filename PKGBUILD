# Maintainer: Tolga Hosgor <fasdfasdas@gmail.com>
_pkgname=postgrespp
pkgname="$_pkgname-git"
pkgver=0.2.2.r4.g3488107
pkgrel=1
pkgdesc="postgres++ is an asynchronous c++ libpq wrapper that aims to make libpq easier to use."
arch=(x86_64)
url="https://github.com/tghosgor/postgrespp"
license=('BSD')
depends=(postgresql-libs boost)
makedepends=(
  boost
  cmake
  git
  make
  postgresql-libs
)
source=("git+https://github.com/tghosgor/postgrespp.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	mkdir -p build
	cd build
	cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=on -DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}

package() {
	cd "$_pkgname"
	make -C build DESTDIR="$pkgdir/" install
}
