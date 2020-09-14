# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart-data
pkgver=1.3
pkgrel=2
pkgdesc="Data files for Sonic Robo Blast 2 Kart"
arch=('any')
license=('custom')
url='https://mb.srb2.org/showthread.php?t=43708'
optdepends=('srb2kart: "Sonic Robo Blast 2 Kart" game')
source=("https://github.com/STJr/Kart-Public/releases/download/v$pkgver/srb2kart-v${pkgver//./}-Installer.exe")
sha256sums=('9a198781cc1f1df2b0a3b6dcf6677c0a8663d0dc182d20cd6bae1bc78f37632e')

prepare() {
	# Workaround: fix broken permissions
	find "$srcdir"/mdls -type d -exec chmod 755 {} \;
}

package() {
	install -d "$pkgdir"/usr/share/games/SRB2Kart
	install -d "$pkgdir"/usr/share/games/SRB2Kart/mdls
	install -m644 {music,textures,gfx,maps,sounds,chars,bonuschars,patch}.kart srb2.srb mdls.dat "$pkgdir"/usr/share/games/SRB2Kart
	cp -dpr --no-preserve=ownership mdls "$pkgdir"/usr/share/games/SRB2Kart
}
