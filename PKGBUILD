# Maintainer: CosmicHeron <dev cosmicheron com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20260927'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
b2sums=('ff420eda4f75b85e3cd86fc58680152e7d98c372f0cd8c45df9b01175ee2523ad8c0344fa096dca607bec3027651462ef6343d6fc7fa2aad93489c0d9585c1f0')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file; do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/shaders/shaders_slang/${_shaders_dir#"${srcdir}"}" "$_file"
	done < <(find "${srcdir}/retro crisis" -type f -iname '*.slangp' -print0)
}
