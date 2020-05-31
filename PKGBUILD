_name=fuse3-p7zip
pkgname="$_name-git"
pkgver=0.9.3
pkgrel=1
pkgdesc="fuse3 file system that uses the p7zip library to mount archives"
arch=('x86_64')
url="https://github.com/andrew-grechkin/fuse3-p7zip"
license=('GPL')
depends=('fuse3' 'p7zip')
makedepends=('cmake')
_commit=75a59761f93a704e4948e032c255c2b60a1d5430
source=("git+https://github.com/andrew-grechkin/fuse3-p7zip#commit=$_commit")
sha256sums=('SKIP')

prepare() {
	cd "$_name"
	git submodule update --init
}

pkgver() {
	cd "$_name"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "$_name"
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-S . -B "build-release"
	make -j -C "build-release"
}

package() {
	cd "$_name"
	make DESTDIR="$pkgdir" install -C "build-release"
}
