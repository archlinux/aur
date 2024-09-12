# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver=20240910
pkgrel=1
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<< "$pkgver").zip")
sha512sums=('7a150d06d50519eb4563c90f9ffc65eebebf0d1980b524965d5530ca827836ccade348e904b8fe3dd11d0bdd388d06816e40b77564f4264ba3b523b4fcba8f1f')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file
	do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
	done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
