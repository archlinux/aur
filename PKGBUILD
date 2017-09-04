# Maintainer: Arvedui <arvedui@posteo.de>

pkgname=dreamfall-chapters-hib
pkgver=r20170825+22bee7
pkgrel=1
epoch=2
pkgdesc="Dreamfall Chapters, humble bundle version"
arch=('x86_64')
url="http://redthreadgames.com/"
license=('custom:commercial')
depends=(glu gtk2)
makedepends=()

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
source=(hib://Dreamfall_Chapters_Linux_2017_08_25.zip
        dreamfallchapters.desktop
        dreamfallchapters)
md5sums=(22bee7bee25920e5cf7febc4b3c12e21
         1223c964a9d19b4960df9772d5a816e2
         f3d4b06b570eb26be68e84be8ba8d93d)


# compression would take ages
PKGEXT='.pkg.tar'


package() {
    mkdir -p $pkgdir/{opt/dreamfallchapters/,usr/bin/,usr/share/pixmaps/}
    cp -r "$srcdir/Dreamfall Chapters_Data/" $pkgdir/opt/dreamfallchapters/
    cp "$srcdir/Dreamfall Chapters" $pkgdir/opt/dreamfallchapters/
    ln -s "/opt/dreamfallchapters/Dreamfall Chapters" $pkgdir/usr/bin/dreamfallchapters

    install -Dm755 $srcdir/dreamfallchapters $pkgdir/usr/bin/dreamfallchapters
    install -Dm644 dreamfallchapters.desktop $pkgdir/usr/share/applications/dreamfallchapters.desktop

    ln -s "/opt/dreamfallchapters/Dreamfall Chapters_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/dreamfallchapters.png"


}
