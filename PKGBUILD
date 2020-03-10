# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=scelta-git
pkgver=0.1.r44.a0f4f70
pkgrel=1
pkgdesc="C++17 zero-overhead syntactic sugar for \"variant\" and \"optional\""
arch=('any')
url="https://github.com/SuperV1234/scelta"
license=('MIT')
depends=()
makedepends=('git' 'cmake')
provides=('scelta')
conflicts=('scelta')
source=(${pkgname}::git+https://github.com/SuperV1234/scelta.git)
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  ./init-repository.sh
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build

	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
