# Maintainer: nathan marchiori <nathan.marchiori@gmail.com>
pkgname="drawy-git"
pkgver=r115.413c4dc
pkgrel=1
pkgdesc="an infinite whiteboard tool"
arch=("x86_64")
url="https://github.com/Prayag2/drawy"
license=('GPL-3.0-only')
depends=('qt6-base>=6.9' 'glibc' 'hicolor-icon-theme' 'gcc-libs')
makedepends=('git' 'cmake' 'qt6-tools' 'gcc' 'vulkan-headers')
provides=('drawy' 'drawy-debug')
source=('drawy-git::git+https://github.com/Prayag2/drawy')
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
	cmake --build build --config Release
}

package() {
	cd "$pkgname"
	install -Dm755 "./build/drawy" "$pkgdir/usr/bin/drawy"
	install -Dm644 "./deploy/appimage/AppDir/usr/share/applications/drawy.desktop" "$pkgdir/usr/share/applications/drawy.desktop"
	install -Dm644 "./deploy/appimage/AppDir/usr/share/icons/hicolor/256x256/apps/drawy.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/drawy.png"
}
