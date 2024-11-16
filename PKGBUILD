# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver='20241115'
pkgrel='1'
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
sha512sums=('3d142946e84080139d92f1d7784d03edd98c34d5c4f0c8c4d3c183754257cf2dc73ef25b28b8745324a14db0f9c8f2269aec527822efcce7bbfa7ca5328400c7')
options=('!debug' '!strip')

package() {
    while IFS= read -d $'\0' -r _file; do
        _shaders_dir="$(dirname -- "$_file")"
        install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
    done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
