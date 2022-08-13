# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

_pkgname="temptations"
pkgname="temptations-git"
pkgdesc="Remake of the MSX game Temptations"
pkgver=0.7855fbf
pkgrel=1
url="https://github.com/pipagerardo/temptations"
arch=('x86_64')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'cmake')
license=('Unknown')
source=("git+$url"
				temptations.png
				temptations.desktop
				temptations.run)
sha512sums=('SKIP'
						'4235664352bc40450c73ae4e5297dc99ade1388af677d09faa1a4df5ac00069a0988cacf109f1d77f5cadaaa648550aa0ab3a94d49154f7184f1021e15a0d4ee'
						'30254998f8a4da9a5d6f41d8bc4aeabf1dbb3bafeb9e7a55cd6f002e304e4aff48baa3cbc70f3cdc1725949dff40505d1dc621df6aabe7d88d6e96aa078eca98'
						'536e1c5e05e623c4a5b5ed6a0dea3ec658ccee7de61f07189bf943efa842dd2c53717f9c6a2157a7cbba29b88f034a9ad4c7c06482929702fd0e0cf20f17b27e'
)

build() {
	cd "$srcdir"/"$_pkgname"/build
	cmake ..
	make
	cp "$srcdir"/"$_pkgname"/build/temptations "$srcdir"/"$_pkgname"/bin
}

package() {
	mkdir -p "$pkgdir"/usr/lib/"$_pkgname"
	install -Dm755 "$srcdir"/"$_pkgname"/bin/temptations "$pkgdir"/usr/lib/"$_pkgname"/temptations
	install -Dm755 "$srcdir"/"$_pkgname".run "$pkgdir"/usr/lib/"$_pkgname"/"$_pkgname".run
	mkdir -p "$pkgdir"/usr/lib/"$_pkgname"/datos
	install -m644 "$srcdir"/"$_pkgname"/bin/datos/* "$pkgdir"/usr/lib/"$_pkgname"/datos/
	mkdir -p "$pkgdir"//usr/lib/"$_pkgname"/graficos
	install -m644 "$srcdir"/"$_pkgname"/bin/graficos/* "$pkgdir"/usr/lib/"$_pkgname"/graficos/
	mkdir -p "$pkgdir"/usr/lib/"$_pkgname"/musica
	install -m644 "$srcdir"/"$_pkgname"/bin/musica/* "$pkgdir"/usr/lib/"$_pkgname"/musica/
	mkdir -p "$pkgdir"/usr/lib/"$_pkgname"/sonidos
	install -m644 "$srcdir"/"$_pkgname"/bin/sonidos/* "$pkgdir"/usr/lib/"$_pkgname"/sonidos
	install -Dm644 "$srcdir"/"$_pkgname".png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
	install -Dm644 "$srcdir"/"$_pkgname".desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
}
