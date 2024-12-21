# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20241221'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
b2sums=('4790542f4243830906ecdb6e871e12d0cab5ffe60571bb988a26f76a23bee99a5eee1789accea88f51215e776ade572774309c5e3cf4bd54265c738a337619e8')
options=('!debug' '!strip')

package() {
    while IFS= read -d $'\0' -r _file; do
        _shaders_dir="$(dirname -- "$_file")"
        install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
    done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
