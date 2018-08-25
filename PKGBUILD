# Maintainer: Vincent Gatine <nurelin@nurelin.eu>
pkgname=eovim-git
pkgver=r322.47c6da7
pkgrel=1
epoch=
pkgdesc="EFL powered Neovim GUI"
arch=('x86_64')
url="https://github.com/jeanguyomarch/eovim"
license=('MIT')
groups=()
depends=('efl' 'neovim' 'msgpack-c')
makedepends=('cmake' 'git' 'python' 'python-jinja')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("eovim-git::git+https://github.com/jeanguyomarch/eovim.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	mkdir -p build
	cd build
	cmake \
	-DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" \
	-DCMAKE_BUILD_TYPE=Release \
	-DLIB_INSTALL_DIR="lib/" \
	..
}

build() {
	cd "$pkgname"
	cmake --build build
}

package() {
	cd "$pkgname"
	cmake --build build --target install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
