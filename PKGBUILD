# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=91.0
pkgrel=4
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
provides=('iridium')
conflicts=('iridium' 'chromium')
depends=('ffmpeg' 'pipewire' 're2' 'harfbuzz-bin-2.9.1')
options=('!emptydirs' '!strip')
makedepends=('patchelf')

source=('https://downloads.iridiumbrowser.de/openSUSE_Tumbleweed/x86_64/iridium-browser-2021.06.91-1.7.x86_64.rpm')

sha256sums=('0517d502f1ce556a46c5384a05c97a86267f43a92f49121321c2fb1ef57315f5')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc" "${pkgdir}/etc"
    ln -s "/usr/lib/libavcodec.so.58.134.100" "${pkgdir}/usr/lib/libavcodec.so.58.134"
    ln -s "/usr/lib/libavformat.so.58.76.100" "${pkgdir}/usr/lib/libavformat.so.58.76"
    ln -s "/usr/lib/libavutil.so.56.70.100" "${pkgdir}/usr/lib/libavutil.so.56.70"
    patchelf "${pkgdir}/usr/lib/chromium/chromium" --replace-needed "libharfbuzz-subset.so.0" "libharfbuzz-subset.so.0.20901.0"
    patchelf "${pkgdir}/usr/lib/chromium/chromium" --replace-needed "libharfbuzz.so.0" "libharfbuzz.so.0.20901.0"
)
