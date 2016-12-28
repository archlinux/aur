# Maintainer: Mateusz Paluszkiewicz <aifam96@gmail.com>

_pkgname=veles
_dlurl='https://git.theaifam5.eu/TheAifam5/Veles'
pkgname=veles-bin
pkgver=2016.12.0
pkgrel=2
pkgdesc="Open source tool for binary data analysis"
url="https://codisec.com/veles"
license=('APLv2')
arch=('x86_64')
depends=('qt5-base' 'libpng' 'icu' 'pcre' 'jsoncpp' 'zlib')
makedepends=('unzip')
provides=('veles')
conflicts=('veles' 'veles-git')
options=('strip')
source=("veles.zip::${_dlurl}/builds/artifacts/master/download?job=build"
        "${_dlurl}/blob/master/LICENSE"
        'Veles.desktop'
        'veles.png')
md5sums=('SKIP'
         '3b83ef96387f14655fc854ddc3c6bd57'
         '4cdd0e07ec8d038ae249632e8bcab25b'
         '22678e3f27959aff238b19b31f1e0898')

package() {
    # Create needed directories
    install -d "${pkgdir}"/{,usr/{,bin,share/pixmaps,share/licenses}}

    # Install Veles binary
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

    # Install pixmap
    install -Dm644 ${_pkgname}.png "${pkgdir}/usr/share/pixmaps/veles.png"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Install launcher
    desktop-file-install Veles.desktop --dir "${pkgdir}/usr/share/applications/"
}