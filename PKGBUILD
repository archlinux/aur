# Maintainer: Joaqim Planstedt <aur@joaqim.xyz>

pkgname=allusion-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="Allusion is a tool built for artists, aimed to help you organize your Visual Library – A single place that contains your entire collection of references, inspiration and any other kinds of images."
arch=('x86_64')
url='https://allusion-app.github.io'
license=('GNU')
makedepends=('curl' 'sed')
depends=('glibc' 'zlib')
options=(!strip)
gittag=$(curl https://github.com/allusion-app/Allusion/releases | sed -n -e "s/^.*releases\/download\/v${pkgver}\(.*\)\/.*.AppImage\".*/\1/p" | head -n1)
gitver="${pkgver}${gittag}"
source_x86_64=("Allusion-${pkgver}.AppImage::https://github.com/allusion-app/Allusion/releases/download/v${gitver}/Allusion-${gitver}.AppImage")
noextract=("Allusion-${pkgver}.AppImage")
sha256sums_x86_64=('6d4e79d5c56f20fd326b9001737c79ee5f9fea2fc94864e1ed84a087572f22d3')

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/Allusion-${gitver}.AppImage" "${pkgdir}/opt/${pkgname}/Allusion.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Allusion.AppImage" "${pkgdir}/usr/bin/allusion"
}
