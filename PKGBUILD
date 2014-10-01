# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=gcs
pkgver=4.0.1
pkgrel=1
pkgdesc="A WYSIWYG editor for building character sheets for GURPS 4th Edition."
arch=('i686' 'x86_64')
url="http://gurpscharactersheet.com"
license=('MPL')
depends=('java-runtime')
src="$pkgname-$pkgver-linux"
if test "$CARCH" == i686; then
src+='-32'
fi
source=("${src}.zip::http://sourceforge.net/projects/gcs-java/files/${src}.zip/download")
md5sums=('SKIP')

build() {
	cd "$src"
	rm -r support/jre
	ln -s /usr/lib/jvm/default/jre support/jre
}

package() {
	install -d $pkgdir/usr/{bin,share}
	cp -dr --no-preserve=ownership ${src} $pkgdir/usr/share/gcs
	ln -s $pkgdir/usr/share/gcs/gcs $pkgdir/usr/bin/gcs
}
