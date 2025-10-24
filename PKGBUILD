# Maintainer: Adiee5 <adiee5@adiee5.ct8.pl>
pkgname=progress-tracker
pkgver=1.7
pkgrel=1
pkgdesc="Simple kanban-style task organiser made in Adwaita style"
arch=("x86_64")
url="https://github.com/smolBlackCat/progress-tracker"
license=('MIT')
depends=('libadwaita' 'gtkmm-4.0' 'tinyxml2' 'glib2' 'glibc' 'gcc-libs' 'hicolor-icon-theme' 'libsigc++-3.0' 'glibmm-2.68' 'spdlog' 'fmt')
makedepends=('cmake' 'catch2' 'git')
source=("$pkgname-$pkgver::git+https://github.com/smolBlackCat/progress-tracker.git#tag=v$pkgver")
sha256sums=("SKIP") # I really don't care enough, sorry

prepare() {
	# I hate you github for not including submodules into release tarballs!
	cd $pkgname-$pkgver
	git submodule init
	git submodule update
}

build() {
	cd "$pkgname-$pkgver"
	cmake -B build -S . -DCMAKE_BUILD_TYPE='None' -DDEVELOPMENT=OFF -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
