pkgname=amplex-vst
pkgver=5.0
pkgrel=1
pkgdesc="Amplex Guitar Amp (VST)"
arch=('x86_64')
url="https://nalexsoft.blogspot.com/2020/07/amplex-multiamp.html"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('curl' 'freetype2' "libcurl-gnutls" 'libglvnd' 'glibc')
optdepends=('ttf-dejavu: proper font rendering')

prepare() {
	cd "$srcdir"

	## Amplex Guitar Amp
	unzip "`xdg-user-dir DOWNLOAD`/Amplex_V${pkgver/./-}_VST_Linux_x64_Debian.zip"
	
	## Presets Archive
	unzip "`xdg-user-dir DOWNLOAD`/Amplex_Presets_V27.zip"
}

package() {
	## Install Guitar Amp Plugin
	install -Dm755 "$srcdir/Amplex_V${pkgver/./-}_VST_Linux_x64_Debian/Amplex_V${pkgver/./-}_x64_Debian.so" "$pkgdir/usr/lib/vst/Amplex-vst.so"
	install -Dm755 "$srcdir/Amplex_V${pkgver/./-}_VST_Linux_x64_Debian/IRbis_V1-0_x64_Debian.so" "$pkgdir/usr/lib/vst/IRbis-vst.so"
	
	## Install Guitar Amp Presets
	cd "$srcdir/Amplex_Presets_V27"
	rm '! Read About.txt'
	for file in *.txt; do
		install -Dm755 "$file" "$pkgdir/usr/share/amplex-presets/$file"
	done
}
