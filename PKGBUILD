# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Antonio Bonifati
# Contributor: renato 
pkgname=ace-of-penguins
_pkgname=ace
pkgver=1.4
pkgrel=3
pkgdesc="A set of Unix/X solitaire games."
arch=('i686' 'x86_64')
url="http://www.delorie.com/store/ace/"
license=('GPL')
depends=('libx11' 'libxpm' 'libpng' 'zlib')
optdepends=('xorg-fonts-100dpi: help support')
source=(http://www.delorie.com/store/ace/$_pkgname-$pkgver.tar.gz
    ace14_fixes.patch canfield.desktop freecell.desktop golf.desktop
    mastermind.desktop merlin.desktop minesweeper.desktop pegged.desktop
    penguins.desktop solitaire.desktop spider.desktop taipei.desktop
    taipei-editor.desktop thornq.desktop)
md5sums=('b80169fa59d69758bb9686f31a84ad2b'
         '371587c1841ba7fe8c41940b71079edc'
         '10589ed7a16e62f128daf627aed08800'
         '05f94f8737b2b5993c3d7b4acaea94a0'
         '1cea6b83041c42061145776507aea602'
         '1ae4b64e486df5ced772a6f05948229e'
         '143977d4730d08d45af83695a545e15f'
         'f53051130ad78fb1c44c386b38b4092f'
         '6e97520466f05c46c7c64e09d760a190'
         'fe008f0b52ecb549d3fecde5bbc34cea'
         '40d2c37e9acde31af7a17d70c8191786'
         'efffd817a86115b4ec2a42c1e6cf5af6'
         '406c388089c52376dfc34a58f419c775'
         '19fce2af99157a940454c868e9ed5c05'
         'd0a6754557f06c0b49fba303705379c5')
 
build() {
  	cd "$srcdir/$_pkgname-$pkgver"
  	patch -p1 -i "$srcdir"/ace14_fixes.patch
  	LDFLAGS="$LDFLAGS -lpng -lz -lm" ./configure --prefix=/usr
  	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install-strip
	for G in "$srcdir"/*.desktop; do 
	    install -Dm644 $G "${pkgdir}"/usr/share/applications/$(basename $G)
	done
}
