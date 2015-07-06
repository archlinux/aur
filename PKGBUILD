# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=ebook2cwgui
pkgver=0.1.2
pkgrel=1
pkgdesc="Converts plain text files to Morse Code formatted as MP3 or OGG - GUI"
arch=('i686' 'x86_64')
url="http://fkurz.net/ham/ebook2cw.html"
license=('GPL')
depends=('ebook2cw' 'wxgtk2.8' 'desktop-file-utils')
install=$pkgname.install
source=(http://fkurz.net/ham/ebook2cw/${pkgname}-${pkgver}.tar.gz
	diff.Makefile
	$pkgname.png
	$pkgname.desktop)

prepare() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	patch -p0 < ../diff.Makefile
}

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	make all
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/usr" install

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications

}
md5sums=('89632a392956a9f3fc66461dfa4e08c6'
         'dee85b87632c1cbf636f2b3b85d2fd0f'
         'b23814eeb1e021202b0cf5a5eed15102'
         '948dbd30b84fcc7222e723a6ec05f7d6')
sha256sums=('211c5593f65743d33c5fb3ce98b118592a7b15c8b807fde34a10660d6ff0812c'
            '8eaa197a372addf48a8327b0d05658480696483d796ea8967f9cb17af8b97b3d'
            'd8990f54e315d9bdba11f4424734b668460f20f20d23f3539b34d5b6d8170125'
            'd10ad0311df45cce7696025ac8bf91648f1090caf353707d01f39784ad03e240')
