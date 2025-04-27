# Maintainer: w568w <w568w at outlook dot com>
pkgname=zonylrctoolsx-bin
_execname="ZonyLrcTools.Cli"
_pkgname="zonylrctoolsx"
pkgver=2024121577
pkgrel=1
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
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::https://github.com/real-zony/ZonyLrcToolsX/releases/download/ZonyLrcToolsX_Alpha.2024121577/ZonyLrcTools_linux-x64_2024121577.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::https://github.com/real-zony/ZonyLrcToolsX/releases/download/ZonyLrcToolsX_Alpha.2024121577/ZonyLrcTools_linux-arm64_2024121577.zip")

noextract=("${_pkgname}-${pkgver}-x86_64.zip" "${_pkgname}-${pkgver}-aarch64.zip")

sha256sums=('7c5d030183eb7f40e71af7248e69d88d5876f5521cdab187248aa489b812b1d0')
sha256sums_x86_64=('b1778845c09275b1214628dda11fddceadf8dc2724f99ed4b7660ad7f9c3110c')
sha256sums_aarch64=('2da6ee5bb4bea8f68b21bfe7a09842ed089ba8c6b707955930fa7536823cb4a7')

prepare() {
        cd "$srcdir"
        mkdir --parents "${_pkgname}"
        bsdtar --extract --file "${_pkgname}-${pkgver}-${CARCH}.zip" --directory "${_pkgname}"
}

package() {
        cd "$srcdir/${_pkgname}"
        install -dm755 "${pkgdir}/opt/${pkgname}"
        install -dm755 "${pkgdir}/usr/bin"
        
        cp --recursive ./* "${pkgdir}/opt/${pkgname}"
        cp "${srcdir}/${_execname}" "${pkgdir}/usr/bin/${_execname}"
}
