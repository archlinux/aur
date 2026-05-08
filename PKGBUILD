# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=chaqchase
_pkgname=lla

pkgname=${_pkgname}-bin
pkgver=0.5.6
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
sha256sums=('cb904b8fa5bed31927cc90ceb678ed1d4e760a66d7a475c03c1b1f5a9de8f6d3'
            'e1eb1617177ac093ef3c891c8de2c6adf03df69d46360f58ad7266a1adbab35e')
sha256sums_x86_64=('de49b086ea914802eb498e335e40bbd52cc50855c8af317c6699fcb0e8b9211a')
sha256sums_i686=('ba8451887e0f34d4f521c1605f01f1e706fb47df653409d1f279559d6707190f')
sha256sums_aarch64=('2c9ac8355b7c7b2b618f6b04b86b39c2a366748c8ab06a70002092c5e6db2db3')

noextract=("${source_x86_64[@]%%::*}" "${source_i686[@]%%::*}" "${source_aarch64[@]%%::*}")

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar --exclude=".*" -xf "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.tzst"

    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
}
