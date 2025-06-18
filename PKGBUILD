# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.20.2
pkgrel=2
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
b2sums_x86_64=('2a851110a54f067defd887948ad23cd7d06859c3c7fb9903f62816577e7ff5ba44429bde7ee3f9a324ab0262df6a0840ac580ebdad53ed25f4d5ae03bbaebcaf')
b2sums_aarch64=('d42ec7c62dc5fec902ed9caddbf6619f8e87ade535508db40bed7d6456db50dd54b7697d3f55a9d81afc7c0ab14bd89da9000d2c8800750e192f35f74825b007')

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd "${_pkgname}-${pkgver}"
    install -Dm755 "bin/bifrost" -t "${pkgdir}/usr/bin/"
    install -Dm755 "bin/bifrost" -t "${pkgdir}/usr/lib/bifrost/bin/"

    install -m 755 -d "${pkgdir}/usr/lib/bifrost/lib/"
    cp -a --no-preserve=ownership "lib/app/" "${pkgdir}/usr/lib/bifrost/lib/"
    cp -a --no-preserve=ownership "lib/runtime/" "${pkgdir}/usr/lib/bifrost/lib/"

    cp -a --no-preserve=ownership "share/" "${pkgdir}/usr/"
}
