# Maintainer: Antonios Rainakis <antonyrai26@gmail.com>

pkgname=unibackpack-git
pkgver=r103.d1d12a7
pkgrel=1
pkgdesc="A Qt6 downloader for software used by greek universities"
arch=('x86_64')
url="https://github.com/open-source-uom/UniBackpack"
license=('GPL')
depends=('qt6-base' 'gcc-libs' 'glibc' 'polkit' 'base-devel')
makedepends=('git' 'cmake' 'ninja')
provides=('unibackpack')
conflicts=('unibackpack')
source=("${pkgname}::git+https://github.com/open-source-uom/UniBackpack.git""unibackpack.desktop")
sha256sums=('SKIP'
'SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$pkgname" -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

    #Installing desktop file
    install -Dm644 unibackpack.desktop "$pkgdir/usr/share/applications/unibackpack.desktop"
}
