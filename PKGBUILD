# Maintainer: Mark Stenglein <aur@markstenglein.com>
name=picocad
pkgname="${name}-bin"
pkgver=102
pkgrel=1
pkgdesc="A program to build and texture lowpoly 3D models."
arch=("x86_64")
url="https://johanpeitz.itch.io/picocad"
license=('custom:commercial')
makedepends=()
depends=('sdl2')
conflicts=("$name")
zipname=${name}-${pkgver}
desktopfile=io.itch.johanpeitz.picoCAD.desktop
toolboxdesktopfile=io.itch.johanpeitz.picoCAD-Toolbox.desktop
source=("local://$zipname.zip"
        "local://toolbox-$pkgver.zip"
        $desktopfile
        $toolboxdesktopfile)
sha256sums=('a2efb498b65fa4a52aea4d2ea1f85cbe154715a690055dc4b0880b805b29b9f6'
            '265292fcf8a64cc95b853ead907e2db94bd1dfbe23ccb6ee23e9d3055f1c2aae'
            '440459a2a2c9b548c0881a68296c4bbf58d0e6b9411076496ecf4e1599ce684c'
            '8c28c2447c96f325593ac61584033f8cd71da0b180e05e043f9d0fb1b46e909f')
options=('!purge')

package() {
    picosrc=$srcdir/$name-$pkgver.bin
    install -Dm755 $picosrc/linux/$name $pkgdir/opt/$name/$name
    install -Dm644 $picosrc/linux/data.pod $pkgdir/opt/$name/data.pod
    install -Dm644 $picosrc/linux/config.txt $pkgdir/opt/$name/config.txt
    install -Dm644 $picosrc/MANUAL-picoCAD.pdf $pkgdir/opt/$name/MANUAL-picoCAD.pdf
    install -Dm644 $picosrc/legal.txt $pkgdir/usr/share/licenses/$pkgname/legal.txt
    install -Dm644 $picosrc/linux/$name.png $pkgdir/usr/share/pixmaps/$name.png
    install -Dm644 $desktopfile $pkgdir/usr/share/applications/$desktopfile
    install -d $pkgdir/opt/$name/examples
    install -Dm644 $picosrc/examples/* $pkgdir/opt/$name/examples/

    toolboxsrc=$srcdir/toolbox-$pkgver.bin
    install -Dm755 $toolboxsrc/linux/toolbox $pkgdir/opt/$name/toolbox/toolbox
    install -Dm644 $toolboxsrc/linux/data.pod $pkgdir/opt/$name/toolbox/data.pod
    install -Dm644 $toolboxsrc/linux/toolbox.png $pkgdir/usr/share/pixmaps/$name-toolbox.png
    install -Dm644 $toolboxdesktopfile $pkgdir/usr/share/applications/$toolboxdesktopfile
}
