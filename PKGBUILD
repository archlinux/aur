# Maintainer: CosmicHeron <dev cosmicheron com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20260820'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip.zip")
b2sums=('3fadc39587de9af8bf11edb70f7830a8cd62dcc268a7e57a7d65d136fc2902f72c3909f7061192ec163fe42ebcd9197225e3574d6b81a6bf5240c16bccc8a82b')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file; do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/shaders/shaders_slang/${_shaders_dir#"${srcdir}"}" "$_file"
	done < <(find "${srcdir}/retro crisis" -type f -iname '*.slangp' -print0)
}
