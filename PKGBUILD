# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=chaqchase
_pkgname=lla

pkgname=${_pkgname}-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Blazing fast 'ls' replacement with superpowers"

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

makedepends=('zstd')
depends=('glibc' 'gcc-libs')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "PLUGINS-${pkgver}.md::${_urlraw}/plugins.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[1]}.pkg.tar.zst")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${pkgrel}-${arch[2]}.pkg.tar.zst")
sha256sums=('a2669a65064aea78f9b870b28c85788c3616faf6954b5e23283799680a8244c3'
            '2e34ae657a397472ef77fb48774f2b581692315c6c86ed5a483a0f450b66e79a')
sha256sums_x86_64=('84a7bfdf8c5827f0ae2972e7e87708742c680fcb23bdebe34f700b1c886877d6')
sha256sums_i686=('85bf3c741952bdb903c81bfab0287f23963751783f161bffc24ac039f71851ea')
sha256sums_aarch64=('37f550ce53382d01cf7e85ffe9e0faa3f92a94e320fa713f6934356d7673e1f8')

noextract=("${source_x86_64[@]%%::*}" "${source_i686[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar --exclude=".*" -xf "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.tzst"

    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
}
