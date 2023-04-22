# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vivlio-bin
_appname=tea-library
pkgver=2.2.1
pkgrel=3
pkgdesc="Vivlio is an eBook reader in ePub and PDF format for PC (Windows or Linux) or Mac."
arch=('x86_64')
url="https://www.vivlio.com/en/"
license=('unknow')
conflicts=()
depends=('alsa-lib' 'libxss' 'at-spi2-core' 'nss' 'gtk3' 'libdrm' 'glib2' 'libxrender' 'sh' 'libxcb' 'libxcursor' \
    'nspr' 'libxi' 'libcups' 'libxcomposite' 'libx11' 'glibc' 'gdk-pixbuf2' 'libxtst' 'dbus' 'gcc-libs' 'libxfixes' \
    'expat' 'pango' 'libxdamage' 'hicolor-icon-theme' 'libxext' 'libxrandr' 'cairo' 'mesa')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::${url}/download/linux64/deb")
sha512sums=('5c0ec550ea5e9e7aa0711e9892d5808fa05e6bfadae0129a737f50c01aec57e5709adb50c2e281c1a599c5eb77d60c746fde30360d5837615847adedc4087a00')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    mv "${pkgdir}/usr/share/doc/${_appname}" "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    mv "${pkgdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        cd "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps";
        mv ${_appname}.png ${pkgname%-bin}.png
    done
    sed 's|Icon=tea-library|Icon=vivlio|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}