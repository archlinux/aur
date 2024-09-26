# Maintainer: w568w <w568w at outlook dot com>
pkgname=zonylrctoolsx-bin
_execname="ZonyLrcTools.Cli"
_pkgname="zonylrctoolsx"
pkgver=2023122272
pkgrel=3
pkgdesc="A command line tool to download lyric (.lrc) files for local songs from online music services."
arch=('x86_64' 'aarch64')
url="https://github.com/real-zony/ZonyLrcToolsX"
license=('MIT')
depends=('zlib')
makedepends=()
provides=("${_pkgname}" "${_execname}")
conflicts=("${_pkgname}" "${_execname}")

# stripping binaries will crash the program
options=(!strip)

source=("${_execname}")
source_x86_64=("${_pkgname}-${pkgver}.zip::https://github.com/real-zony/ZonyLrcToolsX/releases/download/ZonyLrcToolsX_Alpha.2023122272/ZonyLrcTools_linux-x64_2023122272.zip")
source_aarch64=("${_pkgname}-${pkgver}.zip::https://github.com/real-zony/ZonyLrcToolsX/releases/download/ZonyLrcToolsX_Alpha.2023122272/ZonyLrcTools_linux-arm64_2023122272.zip")

noextract=("${_pkgname}-${pkgver}.zip")

sha256sums=('7c5d030183eb7f40e71af7248e69d88d5876f5521cdab187248aa489b812b1d0')
sha256sums_x86_64=('0a9db582c8d0002fa11c0db5c6f0d20d754957fe14313238b2267d4e580716c2')
sha256sums_aarch64=('2ff48eeb8a21e16508eb2daaf16078880008561d058c65952fdfbb358be893ee')

prepare() {
        cd "$srcdir"
        mkdir --parents "${_pkgname}"
        bsdtar --extract --file "${_pkgname}-${pkgver}.zip" --directory "${_pkgname}"
}

package() {
        cd "$srcdir/${_pkgname}"
        install -dm755 "${pkgdir}/opt/${pkgname}"
        install -dm755 "${pkgdir}/usr/bin"
        
        cp --recursive ./* "${pkgdir}/opt/${pkgname}"
        cp "${srcdir}/${_execname}" "${pkgdir}/usr/bin/${_execname}"
}
