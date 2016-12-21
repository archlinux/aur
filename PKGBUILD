# Maintainer: Daniel Peukert <dan.peukert@gmail.com> (itch.io download method from after-school by dcelasun)
pkgname=ravenfield
pkgver=b5_1
pkgrel=1
pkgdesc='A singleplayer battlefield style game.'
arch=('x86_64' 'i686')
url='https://steelraven7.itch.io/ravenfield'
license=('unknown')
makedepends=('unzip')
options=(!emptydirs)
source=(
	"$pkgname"
	"$pkgname.desktop"
	"$pkgname.png"
)
md5sums=(
	'a4e5ad37d50a3f84c18cf913d36b7d50'
	'df8839c9cdfd9418e42abfd058a6e696'
	'f583c26c6415b4de1c3b94d289c37753'
)
[[ "$CARCH" == "x86_64" ]] && _arch=x86_64 || _arch=x86

package() {
	cd "$srcdir"
	curl -o 'ravenfield.zip' "$(curl -s -XPOST "https://steelraven7.itch.io/ravenfield/file/336753?after_download_lightbox=true" | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev |cut -c3- | rev | sed 's/\\\//\//g')"
	unzip -o 'ravenfield.zip'

	mkdir -p "$pkgdir/usr/share/"{"$pkgname",'applications','icons'} "$pkgdir/usr/bin/"
	cp -R "$srcdir/Ravenfield Linux/Ravenfield_Data/" "$pkgdir/usr/share/$pkgname/"
	
	install -m755 "$srcdir/Ravenfield Linux/Ravenfield.$_arch" "$pkgdir/usr/share/$pkgname/Ravenfield"
	install -m755 "$srcdir/ravenfield" "$pkgdir/usr/bin/"
	install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/icons"
}
