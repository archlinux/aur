# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=sanjuuni-ui
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="GUI tool for sanjuuni, which converts images and videos into a format that can be displayed in ComputerCraft."
arch=('x86_64' 'i386' 'armv7l' 'armv7h' 'aarch64' 'powerpc' 'ppc64el' 's390x' 'riscv64' 'riscv32')
url="https://github.com/MCJack123/sanjuuni-ui"
license=('GPL')
groups=()
depends=('qt6-base' 'ffmpeg' 'poco' 'zlib')
makedepends=('opencl-clhpp' 'imagemagick')
checkdepends=()
optdepends=('ocl-icd: OpenCL GPU support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("sanjuuni-ui.tar.gz::https://github.com/MCJack123/sanjuuni-ui/archive/$pkgver.tar.gz"
		"sanjuuni.tar.gz::https://github.com/MCJack123/sanjuuni/archive/$pkgver.tar.gz"
		"sanjuuni-ui.desktop")
noextract=()
sha256sums=('2c2deabb0a97a234c948e6b63c8b9e13dd4661adf99a91d040dad517d7884495'
			'1d9e8f69dd4eb1b4287e2a899eaecf0bde1a0367bd2f0f9643fff8aaa8ed0f93'
			'SKIP')
validpgpkeys=()

prepare() {
	cp -R "sanjuuni-$pkgver"/* "sanjuuni-ui-$pkgver/sanjuuni/"
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
    cd build
	cmake ..
	cmake --build .
}

check() {
	true
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 0755 build/sanjuuni-ui "$pkgdir/usr/lib/sanjuuni-ui/sanjuuni-ui"
	mkdir -p "$pkgdir/usr/bin"
	ln -s ../lib/sanjuuni-ui/sanjuuni-ui "$pkgdir/usr/bin/sanjuuni-ui"
	install -D -m 0644 sanjuuni/32vid-player.lua "$pkgdir/usr/lib/sanjuuni-ui/32vid-player.lua"
	install -D -m 0644 sanjuuni/32vid-player-mini.lua "$pkgdir/usr/lib/sanjuuni-ui/32vid-player-mini.lua"
	install -D -m 0644 sanjuuni/bimg-player.lua "$pkgdir/usr/lib/sanjuuni-ui/bimg-player.lua"
	install -D -m 0644 sanjuuni/raw-player.lua "$pkgdir/usr/lib/sanjuuni-ui/raw-player.lua"
	install -D -m 0644 sanjuuni/websocket-player.lua "$pkgdir/usr/lib/sanjuuni-ui/websocket-player.lua"
	install -D -m 0644 ../sanjuuni-ui.desktop "$pkgdir/usr/share/applications/sanjuuni-ui.desktop"
	install -D -m 0644 icon.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/sanjuuni-ui.png"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps"
	convert icon.png -size 256x256 "$pkgdir/usr/share/icons/hicolor/256x256/apps/sanjuuni-ui.png"
	convert icon.png -size 64x64 "$pkgdir/usr/share/icons/hicolor/64x64/apps/sanjuuni-ui.png"
	convert icon.png -size 32x32 "$pkgdir/usr/share/icons/hicolor/32x32/apps/sanjuuni-ui.png"
	convert icon.png -size 16x16 "$pkgdir/usr/share/icons/hicolor/16x16/apps/sanjuuni-ui.png"
}
