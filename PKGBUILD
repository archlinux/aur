# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=cclite
pkgver=2.0.0
pkgrel=0
pkgdesc="A ComputerCraft emulator (from the Minecraft Mod)"
arch=('any')
license=('Apache')
makedepends=('ant')
depends=('love')
url='https://github.com/Sorroko/cclite'
source=("$url/archive/master.zip"
		'cclite'
		'0001-love.filesystem.-uses-updated-to-work-with-LOVE-11.0.patch'
		'0002-Updates-color-values-to-work-with-LOVE-11.0.patch')
md5sums=('322727bd61fd1d34799b7b28d7531250'
         'd855dcadcb4d0b0f506c78e34976902f'
         '16f772cbb874e9243d6a5e5871705fd0'
         '2dc68c42870b1bd1c107b0256d99f425')

prepare() {
	cd "$srcdir/cclite-master"
	# Patches from a pull request on GitHub
	# https://github.com/Sorroko/cclite/pull/64
	git apply "$srcdir/0001-love.filesystem.-uses-updated-to-work-with-LOVE-11.0.patch"
	git apply "$srcdir/0002-Updates-color-values-to-work-with-LOVE-11.0.patch"
}

build() {
	cd "$srcdir/cclite-master"
	ant love
}

package() {
	cd $pkgdir
	install -D -m 644 -t usr/share/doc/cclite/ "$srcdir/cclite-master/README.md" 
	install -D -m 644 -t usr/lib/cclite/ "$srcdir/cclite-master/dist/CCLite-2.2.0.love" 
	install -D -m 755 -t usr/bin/ "$srcdir/cclite" 
}
