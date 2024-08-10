# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver=20240809
pkgrel=1
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<< "$pkgver").zip")
sha512sums=('c6e253cb5f24f52e1ce0a677c6d87af82b80f0a92a8bebf609c2913cf34c9b909b3f43defe1c3aa4ffea29f6de4ee5dc3d33ab9afe827b3cf747de38c8813c4d')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file
	do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
	done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
