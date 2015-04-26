# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=amidstexporter
pkgver='1.32'
_jarfile='AmidstExporter.jar'
pkgrel=1
pkgdesc='Advanced Minecraft Interface and Data/Structure Tracking; fork with location export.'
arch=('any')
license=('GPL3')
url='http://www.buildingwithblocks.info/exportfromseed.html'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$_jarfile")
changelog=ChangeLog
source=("https://github.com/Treer/AMIDST/releases/download/v${pkgver}/${_jarfile}"
        amidstexporter.sh
        amidstexporter.desktop)
md5sums=('9254cdf1eec26df090dd5c9d76fc3fc9'
         '365558c0aadf7a879ff8f4514943b10c'
         'abe95f51b3ec61a2ae371a05c6edfc1f')

prepare() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --extract --make-directories --insecure 'amidst/resources/icon16.png' 'amidst/resources/icon32.png' 'amidst/resources/icon64.png' < "$_jarfile"
}

package() {
    cd "$srcdir"

    install -vDm755 'amidstexporter.sh'           "$pkgdir/usr/bin/amidstexporter"
    install -vDm644 'amidst/resources/icon16.png' "$pkgdir/usr/share/pixmaps/amidstexporter-16.png"
    install -vDm644 'amidst/resources/icon32.png' "$pkgdir/usr/share/pixmaps/amidstexporter-32.png"
    install -vDm644 'amidst/resources/icon64.png' "$pkgdir/usr/share/pixmaps/amidstexporter-64.png"
    ln -s ./amidstexporter-64.png "$pkgdir/usr/share/pixmaps/amidstexporter.png"
    install -vDm644 'amidstexporter.desktop'      "$pkgdir/usr/share/applications/amidstexporter.desktop"
    install -vDm644 "$_jarfile"                   "$pkgdir/usr/share/java/$pkgname/$_jarfile"
}

# vim:set ts=4 sw=4 et:
