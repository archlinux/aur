# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver=20240830
pkgrel=1
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<< "$pkgver").zip")
sha512sums=('079bd9fb2515720316cf86b95a53d54ada9e967e1d4b437962180d52cf7d5e9b8788d4c164e7f0b1dee9d5e01f81e91c16df8e290f7b1ababac1876de83063c2')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file
	do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
	done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
