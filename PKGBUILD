# Maintainer: Yamashiro <dev cosmicheron com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20260203'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
b2sums=('a5f5765c56277cd6c826a80d008b6622476823a95cbac9be1276ca5181321184de52ad7c104084f60ca480c212909ce269c7f8e6da626a03c196504b4a715c9c')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file; do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/shaders/${_shaders_dir#"${srcdir}/"}" "$_file"
	done < <(find "${srcdir}/shaders_slang" -type f -iname '*.slangp' -print0)
}
