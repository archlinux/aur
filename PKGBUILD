pkgname=hypseus-singe
pkgver=2.12.1
pkgrel=1
pkgdesc="A drop-in replacement to daphne, to play laserdisc arcade games on a PC."
arch=('x86_64' 'aarch64')
url="https://github.com/DirtBagXon/hypseus-singe"
license=('GPL3')
depends=('zlib' 'libzip' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'libvorbis')
makedepends=('cmake')
conflicts=("daphne" "$pkgname-git")
replaces=("daphne" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4a1c5a7425c5957c15aaf3f78b1de4e45e4ba8f6208fbab3945b0d0b120d989')

build()
{
	cd $pkgname-$pkgver/src
	cmake ../src
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm755 scripts/run.sh "$pkgdir"/usr/local/bin/hypseus
	install -Dm755 scripts/singe.sh "$pkgdir"/usr/local/bin/singe
	install -Dm755 src/hypseus "$pkgdir"/usr/local/bin/hypseus.bin
	install -d "$pkgdir"/usr/local/$pkgname/{pics,pics/obsolete,sound,fonts,roms/cputest,screenshots}
	install -m644 pics/*.* "$pkgdir"/usr/local/$pkgname/pics/
	install -m644 roms/cputest/* "$pkgdir"/usr/local/$pkgname/roms/cputest/
	install -m644 sound/* "$pkgdir"/usr/local/$pkgname/sound/
	install -m644 fonts/* "$pkgdir"/usr/local/$pkgname/fonts/
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -d "$pkgdir"/usr/share/doc/$pkgname/
	install -m644 doc/*.* "$pkgdir"/usr/share/doc/$pkgname/
}
