# Creator:  https://github.com/DirtBagXon @ github@pani.cx
# Maintainer:  Nick Bilbrey (beelzebud) <beelzebud@gmail.com>

pkgname=hypseus-singe
pkgver=2.12.0
pkgrel=1
pkgdesc="A drop-in replacement to daphne, to play laserdisc arcade games on a PC."
arch=('x86_64' 'aarch64')
url="https://github.com/DirtBagXon/hypseus-singe"
license=('GPL3')
depends=('zlib' 'libzip' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'libvorbis')
makedepends=('git' 'cmake')
conflicts=("daphne" "$pkgname-git")
replaces=("daphne" "$pkgname-git")
_tag=dac37bcac963407ae719f04b178f80353a4bbc12
source=(git+$url.git#tag=${_tag})
sha256sums=('867668c9dc18a17d7705120c894008bea624f438e6592e859ca6a9b8b290140a')

build()
{
	cd $pkgname/src
	cmake ../src
	make
}

package() {
	cd $srcdir
	install -Dm755 $pkgname/scripts/run.sh "$pkgdir"/usr/local/bin/hypseus
	install -Dm755 $pkgname/scripts/singe.sh "$pkgdir"/usr/local/bin/singe
	install -Dm755 $pkgname/src/hypseus "$pkgdir"/usr/local/bin/hypseus.bin
	install -d "$pkgdir"/usr/local/$pkgname/{pics,pics/obsolete,sound,fonts,roms/cputest,screenshots}
	install -m644 $pkgname/pics/*.* "$pkgdir"/usr/local/$pkgname/pics/
	install -m644 $pkgname/roms/cputest/* "$pkgdir"/usr/local/$pkgname/roms/cputest/
	install -m644 $pkgname/sound/* "$pkgdir"/usr/local/$pkgname/sound/
	install -m644 $pkgname/fonts/* "$pkgdir"/usr/local/$pkgname/fonts/
	install -Dm644 $pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -d "$pkgdir"/usr/share/doc/$pkgname/
	install -m644 $pkgname/doc/*.* "$pkgdir"/usr/share/doc/$pkgname/
}
