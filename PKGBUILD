# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver=20240819
pkgrel=1
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<< "$pkgver").zip")
sha512sums=('19754a9cec9da3c0bae173e034934c71304c182a02b15032f86331dc8c937c587e9cae0e5fcdbeaabf4d3ca4a4164abaecf996a9d1ebf82c40fdd7ba5a2997a2')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file
	do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
	done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
