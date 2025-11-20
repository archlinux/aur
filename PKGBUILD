# Maintainer: Yamashiro <dev cosmicheron com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20251119'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
b2sums=('5cc9c0b90afad26ebe1f9297b79e880280d454a7d559210158ae288ecf990134435f02db2f6f3fac3996af584c74d248b102f179f18b8297c6b44812212ce768')
options=('!debug' '!strip')

package() {
    while IFS= read -d $'\0' -r _file; do
        _shaders_dir="$(dirname -- "$_file")"
        install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
    done < <(find "${srcdir}/shaders" -type f -iname '*.slangp' -print0)
}
