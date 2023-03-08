# Maintainer: Yunus Emre Aydın <yunusaydin590 at gmail dot com>

_git_repo_name="Electra-Lang"
pkgname="electra-git"
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Electra is an esolang where you code like an electrician"
arch=("x86_64" "i686")
url="https://github.com/DolphyWind/$_git_repo_name.git"
license=("MIT")
groups=()
depends=("gcc-libs" "glibc")
makedepends=("git" "cmake")
checkdepends=()
optdepends=()
provides=("electra")
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
	cd "$_git_repo_name"
	git describe --tags --abbrev=0 | cut -c2-99 # Only if I published a new tag
}

build() {
	cd "$_git_repo_name"
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	cd "$_git_repo_name/build"
	make DESTDIR="$pkgdir/" install
	cd ..
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
	install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
}
