# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver=20241007
pkgrel=1
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
sha512sums=('d0120d5db48207f0566798a879352d199d3a0b8387150d9d496cc865831f06192efd5587041ec4f65d122f87404498e46571f91c05929117eb1d24e3468e0cd2')
options=('!debug' '!strip')

package() {
    while IFS= read -d $'\0' -r _file; do
        _shaders_dir="$(dirname -- "$_file")"
        install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
    done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
