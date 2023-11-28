# Maintainer: Faye Jackson <justalittleepsilon@gmail.com>
# Maintainer: Lobo Torres <lobo@praderi.es>

pkgname=msync
pkgver=0.9.9.8
pkgrel=1
pkgdesc="A low bandwidth store and forward Mastodon / Pleroma API command line client"
arch=(any)
url="https://github.com/Kansattica/msync"
license=("GPL-3.0-only")
depends=(curl)
makedepends=(gcc cmake pandoc)
changelog=
source=("https://github.com/Kansattica/msync/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("12519be285fd2b0e5a29d610b7971f90b4a9a449e46a78ec830bc0c2df9c4fad")

build() {
	cd "$srcdir/msync-${pkgver}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DMSYNC_BUILD_TESTS=OFF -DMSYNC_USER_CONFIG=ON -DMSYNC_FILE_LOG=OFF
	cmake --build . --parallel
	cd "$srcdir/msync-${pkgver}"
	bash ./scripts/make_man_page.sh ./build/msync
}

package() {
	cd "$srcdir/msync-${pkgver}"
	install -Dm0755 build/msync "$pkgdir/usr/bin/msync"
	install -Dm0644 msync.1.gz "$pkgdir/usr/share/man/man1/msync.1.gz"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/msync/LICENSE"
}
