# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.20.4
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
b2sums_x86_64=('657dd368100c51a9733ec033ef44ce61f7ac3ba90dcbb08a64b98fa303290c4128ab4f9557894821fa5da21e6d91dbf496c13d999961a6dd583e09466478c615')
b2sums_aarch64=('06c42645e9bd313dffa7a85a0cae061442746b6c5d464427bc7bd825ac8607cd9feba2decf0c46c0394a51818217572f2ca4bab6ee821db6d2eee01dd030ab84')

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
