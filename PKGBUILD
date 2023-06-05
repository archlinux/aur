# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="medict-bin"
pkgver=2.0.10
pkgrel=1
pkgdesc="A cross platform dictionary application,support mdict (*.mdx/*.mdd) dictionary format"
arch=("x86_64")
url="https://github.com/terasum/medict"
license=('MIT')
depends=('glib2' 'glibc' 'pango' 'libcups' 'libdrm' 'nss' 'dbus' 'libxrandr' 'libxdamage' 'mesa' 'libxcb' 'libxkbcommon' \
    'nspr' 'libxcomposite' 'gcc-libs' 'libxfixes' 'libxshmfence' 'libx11' 'libxext' 'gdk-pixbuf2' 'expat' 'gtk3' 'alsa-lib' \
    'cairo' 'at-spi2-core')
source=("${pkgname%-bin}-${pkgver}_amd64.zip::${url}/releases/download/v${pkgver}-latest/${pkgname%-bin}-linux-amd64-${pkgver}-6d93e4c-20211020T110929UTC.zip"
    "LICENSE::https://raw.githubusercontent.com/terasum/medict/master/LICENSE")
sha256sums=('2f4f90af2945f92272e7119a80937481cf34c1c8d78ccdec5bb8849ef2654b83'
            '590729f7f97ea0ad2baabbb6d8e23e0458520a3e2d9bc14d730c43ee43225d64')
      
package() {
    ar -x "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}