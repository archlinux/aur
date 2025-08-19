# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.20.3
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
b2sums_x86_64=('04a7b9bec7696713581b0af8077cb6090a8860a750cd8c17d1c8f91f91966ec9b6cd022285ab9819de2e07047943c1f200f4dbf1609ee5510193ff184cc4ae43')
b2sums_aarch64=('fb6f84d5a4f9db6b092ab4bb6f11de037f789a61821721c74bfc2056554275439e825eea32c270a6d7d53d9baa14b59275267b6fa326e64e5f75c9a8cbfa4c8b')

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
