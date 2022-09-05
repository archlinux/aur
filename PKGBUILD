# Maintainer: Edgar Luque <git@edgarluque.com>
pkgname=digital
pkgver=0.29
pkgrel=3
pkgdesc="A digital logic designer and circuit simulator."
arch=('x86_64')
url="https://github.com/hneemann/Digital"
license=('GPL')
makedepends=('imagemagick' 'librsvg')
depends=('java-runtime' 'imagemagick')
source=("$pkgname-$pkgver.zip::https://github.com/hneemann/Digital/releases/download/v${pkgver}/Digital.zip"
    "digital.desktop")
sha256sums=("4d61e2776100ddfe3f8638886e5b33e3b99165eefefaf9ba5c9b9fad1f47f3a7"
"9321b9c6c0a038782e0334190ed7d345d170c00cef0c5d784aaa9cb4bfab4ed0")

build() {
	echo -e "#!/usr/bin/env bash\njava -jar /usr/share/java/$pkgname/$pkgname.jar \$@" > "$srcdir/$pkgname.sh"

	for SIZE in 16 32 48 128 256 512
	do
	    convert "$srcdir/Digital/icon.svg" -resize ${SIZE}x${SIZE} "$srcdir/digital_${SIZE}x${SIZE}.png"
	done
}

package() {
	install -vDm644 "$srcdir/Digital/docu/Documentation_en.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_en.pdf"
	install -vDm644 "$srcdir/Digital/docu/Documentation_de.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_de.pdf"
	install -vDm644 "$srcdir/Digital/docu/Documentation_es.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_es.pdf"
	install -vDm644 "$srcdir/Digital/docu/Documentation_pt.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_pt.pdf"
	install -vDm644 "$srcdir/Digital/docu/Documentation_fr.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_fr.pdf"
	install -vDm644 "$srcdir/Digital/docu/Documentation_zh.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_zh.pdf"
	install -vDm644 "$srcdir/Digital/ReleaseNotes.txt" "$pkgdir/usr/share/doc/$pkgname/changelog.txt"
	install -vDm644 "$srcdir/Digital/Digital.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -vDm644 "$srcdir/Digital/linux/digital-simulator.xml" "$pkgdir/usr/share/mime/packages/digital-simulator.xml"
	install -vDm644 digital.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	for SIZE in 16 32 48 128 256 512
	do
	    install -vDm644 "$srcdir/digital_${SIZE}x${SIZE}.png" "$pkgdir/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/digital.png"
	done
	cd "$srcdir/Digital/lib/"
	find . -exec install -vDm644 "{}" "$pkgdir/usr/share/java/$pkgname/lib/{}" \;
	cd ../examples
	find . -exec install -vDm644 "{}" "$pkgdir/usr/share/java/$pkgname/examples/{}" \;
	cd ../../../
}
