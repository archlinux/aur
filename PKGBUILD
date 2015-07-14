# Maintainer:  Ainola

pkgname=broken-age-hib
pkgver=2.2
pkgrel=1
epoch=2
pkgdesc="Broken Age is a point-and-click adventure telling the stories of a young boy and girl leading parallel lives. (Humble Bundle Version)"
arch=('i686' 'x86_64')
url="http://www.brokenagegame.com/"
license=('custom: commercial')
depends_i686=('libgl')
depends_x86_64=('lib32-libgl')
source=("hib://BrokenAge_linuxv${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=("c54217733bd335ab57c8dfbeb9e1f7515732732ac881c4daaa794b4ec0a086ab"
            "b9962cb73ed2807a095c4c535d70ad90e097a3cee2143d99256d875ce6eae412"
            "1344c36f86b3b8530a0d68f2e47908eaf950cc6ba28a680837097cceffe36506"
            "9582f8603a4927fff9a2d07306416603293cfbfa3ffc2ac0715da83b2c757a48")

# Prevent compressing final package
PKGEXT='.pkg.tar'

# You need to download the Humble Bundle file manually or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=("hib::/usr/bin/echo %u - This is is not a real URL, you need to download the humble bundle file manually to \"$PWD\" or setup a hib:// DLAGENT. Read this PKGBUILD for more information.")

package() {
    # Install .desktop
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Move all the gamedata
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cd "$srcdir"
    mv lib *.pck ReadMe.txt BrokenAge "${pkgdir}/opt/${pkgname}"
    install -Dm755 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Launcher
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
