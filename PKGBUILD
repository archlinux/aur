# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

pkgname='pkedit-qt'
pkgver=0.5.2
pkgrel=2
url="https://codeberg.org/ramenu/pkedit-qt"
pkgdesc='QT GUI frontend utilizing libpkedit'
arch=('x86_64' 'i686' 'aarch64')
makedepends=('cmake')
depends=('glibc' 'libpkedit' 'qt6-base')
license=('GPL-3.0-only')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname.desktop"
)
b2sums=('48f6c955afba950a88506436a5ce9bcd70fefd5b36dd95cf526c33b3bf3233c7dc53c21aec7761bd1604eb1545956dabb2a4424537c342bde0979721ec789f37'
        '3dde226f5dad5bf01397d3885822bef863ba39e94f6c5ebeec641bfef0cb716eb3f26b471be9d6d0c63a537fd21ff22a2b9f4e27c63fb255bae9d0aefbdb2a7b')

build() {
	local cmake_options=(
	    -B build
	    -S "$pkgname"
	    -G 'Unix Makefiles'
	    -W no-dev
	    -D CMAKE_BUILD_TYPE=Release
	    -D CMAKE_INSTALL_PREFIX=/usr
	    -D CMAKE_CXX_STANDARD=20
	  )
	  cmake "${cmake_options[@]}"
	  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
