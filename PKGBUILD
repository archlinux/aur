# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=sanjuuni
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="Converts images and videos into a format that can be displayed in ComputerCraft."
arch=('x86_64' 'i386' 'armv7l' 'armv7h' 'aarch64' 'powerpc' 'ppc64el' 's390x' 'riscv64' 'riscv32')
url="https://github.com/MCJack123/sanjuuni"
license=('GPL')
groups=()
depends=('ffmpeg' 'poco' 'zlib')
makedepends=('opencl-clhpp')
checkdepends=()
optdepends=('ocl-icd: OpenCL GPU support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MCJack123/sanjuuni/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('1d9e8f69dd4eb1b4287e2a899eaecf0bde1a0367bd2f0f9643fff8aaa8ed0f93')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	# Fix for FFmpeg 7.0
	sed 's/swr_alloc_set_opts/swr_alloc_set_opts2/' configure > configure.new
	mv configure.new configure
	chmod +x configure
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	true
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 0755 sanjuuni "$pkgdir/usr/lib/sanjuuni/sanjuuni"
	mkdir -p "$pkgdir/usr/bin"
	ln -s ../lib/sanjuuni/sanjuuni "$pkgdir/usr/bin/sanjuuni"
	install -D -m 0644 32vid-player.lua "$pkgdir/usr/lib/sanjuuni/32vid-player.lua"
	install -D -m 0644 32vid-player-mini.lua "$pkgdir/usr/lib/sanjuuni/32vid-player-mini.lua"
	install -D -m 0644 bimg-player.lua "$pkgdir/usr/lib/sanjuuni/bimg-player.lua"
	install -D -m 0644 raw-player.lua "$pkgdir/usr/lib/sanjuuni/raw-player.lua"
	install -D -m 0644 websocket-player.lua "$pkgdir/usr/lib/sanjuuni/websocket-player.lua"
}
