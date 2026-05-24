# Maintainer: Dr. Richard Kellnberger
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alois Nespor <alium@centrum.cz>
# Contributor: kikadf <kikadf.01@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: thacrazze <thacrazze|googlemail|com>

pkgname=clipgrab-qt6
_name=clipgrab
pkgver=4.0.0
pkgrel=1
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ...'
arch=('x86_64')
url='https://github.com/Richardk2n/ClipGrab'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-webengine' 'yt-dlp')
optdepends=('ffmpeg: for the conversion functionality')
provides=(${_name})
conflicts=(${_name})
source=("https://github.com/Richardk2n/ClipGrab/archive/refs/tags/v$pkgver.tar.gz"
        "${_name}.desktop")
sha256sums=('f1c092b5a0d46be66db53478f531d604a8287d4d931207000390d1612d1537d8'
            '840910097d8c129ea12c395c4a33f562591e878e521c98fde8a7b3f9403aa23f')

build() {
    cd "ClipGrab-${pkgver}"
    cmake .
    cmake --build .
}

package() {
    cd "ClipGrab-${pkgver}"
    install -Dm755 "src/${_name}" -t "${pkgdir}/usr/bin"
    install -Dm644 images/icon.png "${pkgdir}/usr/share/pixmaps/${_name}.png"
    install -Dm644 "${srcdir}/${_name}.desktop" -t "${pkgdir}/usr/share/applications"
}
