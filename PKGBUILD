# Maintainer: RifsxD <33044977+rifsxd at users dot noreply dot github dot com>

pkgname=blazefetch-git
_pkgname=blazefetch
pkgver=2.8.3
pkgrel=1
pkgdesc='A lite & blazing fast system info fetch utility'
arch=('any')
url='https://github.com/rifsxd/blazefetch'
license=('MIT')
provides=('blazefetch-git')
conflicts=('blazefetch')
depends=('libx11' 'networkmanager' 'playerctl' 'figlet' 'pciutils' 'mesa-utils')
makedepends=('cmake' 'ninja' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')

prepare(){
	cd "$_pkgname/src"
	COMMIT_HASH=$(git rev-parse HEAD) && COMMIT_HASH_GIT="${COMMIT_HASH}-git" && EXISTING_VERSION=$(grep -oP '#define VERSION "\K[0-9]+\.[0-9]+\.[0-9]+' ./helper/version.cpp) && VERSION="$EXISTING_VERSION-$COMMIT_HASH_GIT" && sed -i "s/#define VERSION .*/#define VERSION \"$VERSION\"/" ./helper/version.cpp
}

build() {
  	cd "$_pkgname/src"
  	rm -rf build
	mkdir build
  	cd build 
  	cmake -G Ninja ..
  	ninja
}

package() {
	cd "$_pkgname"
	install -D "src/build/bin/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
