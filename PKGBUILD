# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Faye Jackson <justalittleepsilon@gmail.com>
pkgname=msync-git
pkgver=0.9.8.r1099.a1132ef
pkgrel=1
pkgdesc="A low bandwidth store and forward Mastodon / Pleroma API command line client"
arch=(any)
url="https://github.com/Kansattica/msync.git"
license=('GPL')
depends=(curl)
makedepends=(git cmake gcc)
provides=(msync)
conflicts=(msync)
changelog=
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/msync"
	printf "0.9.8.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/msync"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DMSYNC_BUILD_TESTS=OFF -DMSYNC_USER_CONFIG=ON -DMSYNC_FILE_LOG=OFF
	cmake --build . --parallel
}

package() {
	cd "$srcdir/msync"
	install -Dm0755 build/msync "$pkgdir/usr/bin/msync"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/msync/LICENSE"
}
