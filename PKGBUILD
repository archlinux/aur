# Maintainer: Yamashiro <dev cosmicheron com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20260321'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
b2sums=('fba0c331030668a8e155c920820704a45527b8c5f87ea233ab383e8b6d7870cbcfd9797976f0d3d5c595cf550042872da68064939d4901061b01379da35791b2')
options=('!debug' '!strip')

package() {
	while IFS= read -d $'\0' -r _file; do
		_shaders_dir="$(dirname -- "$_file")"
		install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
	done < <(find "${srcdir}/shaders" -type f -iname '*.slangp' -print0)
}
