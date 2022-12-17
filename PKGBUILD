pkgname=derclou-git
pkgver=2.7_r14.7b219e7
pkgrel=2
pkgdesc="Der Clou! - SDL2 Port"
arch=(x86_64 aarch64)
url=https://github.com/vcosta/derclou
license=(custom:{'Der Clou! Public License Contract',MAME} 'MIT/ICU (portion)')
depends=(sdl2)
optdepends=('zlodej: provides game data for the Czech version')
install=derclou.install
source=(
	git+https://github.com/vcosta/derclou.git
	derclou.{webp,desktop})	# Icon: https://music.apple.com/us/album/pc-game-soundtrack-der-clou/407515097, cutout with https://zyro.com/tools/image-background-remover
md5sums=(
	SKIP
	7a8651d5231faf64f1b722e333a39ed3
	ca12227a09654baaf699f232cdc9b57a)
pkgver(){
	cd derclou
	echo 2.7_r`git rev-list --count HEAD`.`git rev-parse --short HEAD`
}
build(){
	cd derclou
	sed -i s/linear/nearest/ gfx/gfx.c	# partial fix for scaling
	sed -i '/setup.Scale/s/= 1/= 2/' base/base.c	# 640x400 window size
	make
}
package(){
	cd derclou
	install derclou -Dt "$pkgdir"/usr/bin
	install LICENSE mame.txt publiclicencecontract.doc -Dt "$pkgdir"/usr/share/licenses/derclou
	install ChangeLog README -Dt "$pkgdir"/usr/share/doc/derclou
	install ../derclou.webp -D "$pkgdir"/usr/share/pixmaps/derclou.png
	install ../derclou.desktop -Dt "$pkgdir"/usr/share/applications
}
