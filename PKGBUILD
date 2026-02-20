# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.20.5
pkgrel=1
pkgdesc="Samsung Firmware Downloader"
url='https://github.com/zacharee/SamloaderKotlin'
arch=('x86_64' 'aarch64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'zlib' 'libglvnd' 'libxi' 'hicolor-icon-theme' 'libxtst' 'libx11' 'libxrender' 'libxext' 'alsa-lib' 'fontconfig' 'freetype2')
source=("https://raw.githubusercontent.com/zacharee/SamloaderKotlin/refs/tags/${pkgver}/LICENSE.txt")
source_x86_64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.tar.gz")
b2sums=('693b28ed14fb782eab4399104bb968fe613447c1f005495a5cd3791f3032e71dbb6b418cfa4b874562891deb60d4fb53ca1e7f965b571c35f6bdba0eb5d624d4')
b2sums_x86_64=('6e99dc35d52da6c2b40d70a1664a9c689f4d36241678b4e8beb2d41495444bc795778df84993a8cef6736a83ea66d32b8259f17bf4187b13e74dea7cd4ac11da')
b2sums_aarch64=('0bb2c804c7d115db73929420294317d47c24897a1759e28815e645b7910520e6dd711adee6164c2cf52495f6ed2628ae080c943a73c0a0c9dd7f83f92d318cdb')

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd "${_pkgname}-${pkgver}"
    install -m 755 -d "${pkgdir}/usr/bin"
    install -Dm755 "bin/bifrost" -t "${pkgdir}/usr/lib/bifrost/bin/"
    ln -s "/usr/lib/bifrost/bin/bifrost" "$pkgdir/usr/bin/bifrost"

    install -m 755 -d "${pkgdir}/usr/lib/bifrost/lib/"
    cp -a --no-preserve=ownership "lib/app/" "${pkgdir}/usr/lib/bifrost/lib/"
    cp -a --no-preserve=ownership "lib/runtime/" "${pkgdir}/usr/lib/bifrost/lib/"

    cp -a --no-preserve=ownership "share/" "${pkgdir}/usr/"
}
