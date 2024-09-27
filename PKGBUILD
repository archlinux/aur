# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='retro-crisis-gdv-ntsc'
pkgver=20240913
pkgrel=2
arch=('any')
pkgdesc='CRT shader preset for Libretro based on Guest Advanced NTSC'
url='https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC'
license=('GPL-3.0-only')
depends=('libretro-shaders-slang')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Retro.Crisis.GDV-NTSC.$(sed 's/./&./6;s/./&./4' <<<"$pkgver").zip")
sha512sums=('612f3e96ce1d47da6466026018ccdc311e20a9fe5b2335a13cee070c7c28cf260df828d8f011b98a6eb1ec1265d112c239f7c03e395950c2e7d022ae8e272889')
options=('!debug' '!strip')

package() {
    while IFS= read -d $'\0' -r _file; do
        _shaders_dir="$(dirname -- "$_file")"
        install -Dm644 -t "${pkgdir}/usr/share/libretro/${_shaders_dir#"${srcdir}/"}" "$_file"
    done < <(find "$srcdir" -type f -iname '*.slangp' -print0)
}
