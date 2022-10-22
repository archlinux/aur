# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=nickvision-tube-converter
pkgver=2022.10.3
pkgrel=1
pkgdesc="An easy-to-use YouTube video downloader"
arch=(x86_64)
url="https://github.com/nlogozzo/NickvisionTubeConverter"
license=(GPL3)
depends=(gtk4 libadwaita jsoncpp libcurlpp yt-dlp webkit2gtk-5.0 ffmpeg)
makedepends=(git cmake)
source=("git+https://github.com/nlogozzo/NickvisionTubeConverter.git#tag=${pkgver}"
        "don-t-install-pre-built-binaries.patch")
sha256sums=('SKIP'
            'b62854996f6539748c1fedeb09d67ebc0c06681adeb4173b053d3c2b5e9df74f')

build() {
    cd "$srcdir/NickvisionTubeConverter"
    patch -p1 < "$startdir/don-t-install-pre-built-binaries.patch"
    meson builddir --prefix=/usr
}

package() {
    cd "$srcdir/NickvisionTubeConverter"
    DESTDIR="${pkgdir}" ninja -C builddir install
    ln -s /usr/bin/org.nickvision.tubeconverter "${pkgdir}/usr/bin/${pkgname}"
}
