# Maintainer: Yunus Emre Aydın <yunusaydin590 at gmail dot com>

_git_repo_name="Electra-Lang"
pkgname="electra-git"
pkgver=2.0.0.1.gc7a8449
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
	git switch stable
	git describe --tags | sed 's/-/./g' | cut -c2-99
}

build() {
	cd "$_git_repo_name"
	git switch stable
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
