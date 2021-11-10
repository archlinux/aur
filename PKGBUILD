# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=95.0
pkgrel=1
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
provides=('iridium')
conflicts=('iridium' 'chromium')
depends=('ffmpeg' 'pipewire' 're2')
options=('!emptydirs' '!strip')

source=('https://downloads.iridiumbrowser.de/openSUSE_Tumbleweed/x86_64/iridium-browser-2021.10.95.1-1.4.x86_64.rpm')

sha256sums=('ca7eca725da5eba624b117c7db7b307b602767815d0381d39cd0dfbb6c65f0c3')

package() (
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/etc/iridium-browser"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc/iridium-browser" "${pkgdir}/etc/iridium-browser"
    # Why does /usr/bin/iridium point to /usr/lib64/chromium/chrome-wrapper?
    rm -f "${pkgdir}/usr/bin/iridium" "${pkgdir}/usr/bin/chromium" "${pkgdir}/usr/bin/chromium-browser"
    # Surely we only need iridium-browser, right?
    ln -s "/usr/bin/iridium-browser" "${pkgdir}/usr/bin/iridium"
    ln -s "/usr/bin/iridium-browser" "${pkgdir}/usr/bin/chromium"
    ln -s "/usr/bin/iridium-browser" "${pkgdir}/usr/bin/chromium-browser"

)
