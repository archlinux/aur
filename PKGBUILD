# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=amidst
pkgver='3.6_beta_4'
_jarfile="${pkgname^^}-${pkgver//_/-}.jar"
pkgrel=1
pkgdesc='Advanced Minecraft Interface and Data/Structure Tracking'
arch=('any')
license=('GPL3')
url='http://www.minecraftforum.net/topic/626786-'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$_jarfile")
changelog=ChangeLog
source=("https://bitbucket.org/skiphs/amidst/downloads/$_jarfile"
        amidst.sh
        amidst.desktop)
md5sums=('ff61a5b390a40e8b77470c90bc546c6e'
         '783c4040c9736f96ce72e9997833a0bf'
         '3c6900ac68e3175768322e684f9f1bcb')

prepare() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --extract --make-directories --insecure 'amidst/resources/icon.png' < "$_jarfile"
}

package() {
    cd "$srcdir"

    install -vDm755 'amidst.sh'                 "$pkgdir/usr/bin/amidst"
    install -vDm644 'amidst/resources/icon.png' "$pkgdir/usr/share/pixmaps/amidst.png"
    install -vDm644 'amidst.desktop'            "$pkgdir/usr/share/applications/amidst.desktop"
    install -vDm644 "$_jarfile"                 "$pkgdir/usr/share/java/$pkgname/AMIDST.jar"
}

# vim:set ts=4 sw=4 et:
