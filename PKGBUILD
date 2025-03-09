# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20250308'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
b2sums=('2b9cc4c2b92890e6a641a66b00063f61a6a8bb21a6252d10a0fc0ab215a8c772a29fa26950e473672a20b3a84167ce4dbe2dc6eca1f945a359e188d98f8f7ef9')
options=('!debug' '!strip')

package() {
    while IFS= read -d $'\0' -r _file; do
        _shaders_dir="$(dirname -- "$_file")"
        install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
    done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
