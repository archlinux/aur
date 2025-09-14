# Maintainer: Crispy <crispyaur@proton.me>


# Modified version of the AUR package 'allusion-appimage' as the official release hasn't been updated in years.
# Uses RafaUC fork of the official allusion-appimage git repo.
# Check for new releases: https://github.com/RafaUC/Allusion/releases
# or use:
# $ curl -sL $(curl -s https://github.com/RafaUC/Allusion/releases | sed -n -e "s/^.*\(\/allusion-app\/Allusion\/releases\/download\/.*\/latest-linux.yml\)\".*/https:\/\/github.com\1/p" | head -n1)

pkgname=allusion-appimage-rafauc
pkgver=1.0.0
pkgrel=2
pkgdesc="Allusion is a tool built for artists, aimed to help you organize your Visual Library – A single place that contains your entire collection of references, inspiration and any other kinds of images."
arch=('x86_64')
url='https://github.com/RafaUC/Allusion'
license=('GNU')
makedepends=('curl' 'sed')
conflicts=('allusion-appimage')
depends=('glibc' 'zlib' 'fuse2')
options=(!strip)
gittag=$(curl -s https://github.com/RafaUC/Allusion/releases | sed -n -e "s/^.*releases\/download\/v${pkgver}\(.*\)\/.*.AppImage\".*/\1/p" | head -n1)
gitver="${pkgver}${gittag}"
source_x86_64=("Allusion-${gitver}.AppImage::https://github.com/RafaUC/Allusion/releases/download/v${gitver}/Allusion-${gitver}.AppImage"
               "Allusion.desktop"
	       "Allusion.svg::https://raw.githubusercontent.com/RafaUC/Allusion/refs/heads/master/resources/logo/svg/full-color/allusion-logomark-fc.svg"
               "LICENSE::https://raw.githubusercontent.com/RafaUC/Allusion/refs/heads/master/LICENSE"
               )
noextract=("Allusion-${gitver}.AppImage")
sha256sums_x86_64=('6fd68e6e6575b9e02030f1796dbd536165f671bb5e5bcd89c313f63d056be73b'
                   'df1225b564f5301ce2a092e63856012db0370861c317bfa65586e06a842f2438'
                   'fdaccc7f6521f98b22b31b5996f65929b33068b86aaacd6ec00727b1a5fee2fa'
                   '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

package() {

    # Install AppImage
    install -Dm755 "${srcdir}/Allusion-${gitver}.AppImage" "${pkgdir}/opt/${pkgname}/Allusion-${pkgver}.AppImage"

    # Install the icon and desktop file
    install -D -m644 "Allusion.svg"  "${pkgdir}/usr/share/pixmaps/Allusion.svg"
    install -D -m644 "Allusion.desktop" "${pkgdir}/usr/share/applications/Allusion.desktop"

    # Install the license file
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Allusion-${pkgver}.AppImage" "${pkgdir}/usr/bin/allusion"
}
