# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-rainbow-cursor-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Material Based Cursor Theme: Rainbow"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.br.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver.br/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('aac6b66909ec32b17be3cb6f4603cfe674e50022053fec268c15413b100b4c5c'
            'efd03ab61d077d7a3b93bfef135a6a061e41373656c05cdf5851bf516101b261')

prepare() {
	cd Bibata_Cursor-$pkgver.br
	mkdir -p bitmaps
	bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps

	rm -rf themes
}

build() {
	cd Bibata_Cursor-$pkgver.br
	python build.py --x11
}

package() {
	cd Bibata_Cursor-$pkgver.br
	install -d "$pkgdir"/usr/share/icons
	cp -r themes/Bibata-* "$pkgdir"/usr/share/icons
	chmod -R 755 "$pkgdir"/usr/share/icons/Bibata-*
}
