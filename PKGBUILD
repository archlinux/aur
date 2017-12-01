# Maintainer: alex

pkgname=freeplane-srcbuild
_pkgname=freeplane
pkgver=1.6.10
pkgrel=1
pkgdesc="A free mindmapping and knowledge management tool"
arch=('i686' 'x86_64')
url="http://freeplane.sourceforge.net"
license=('GPL2')
makedepends=('gradle')
depends=('java-runtime' 'bash' 'libxtst')
conflicts=('freeplane' 'freeplane-beta' 'freeplane-bzr')
source=(http://downloads.sourceforge.net/sourceforge/freeplane/freeplane_src-${pkgver}.tar.gz 'freeplane.desktop' 'freeplane.run')
sha256sums=('601be6ce66fdd4710d06e17aa6736cdcde5936b9183858d3d280a7a92f66a2a1'
            'a1c7e9b276c9566fcb806322b6e3ad8e6ce66718d788b42a1063683e39f9de4c'
            'e7b7d4e0fddce2af3909a1ebbd18928bcc917a809fe460c140978e7b0530387c')


build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    gradle -Dbuild="$pkgdir/usr/share/${_pkgname}" build
}

package() {
    mkdir -p "$pkgdir/usr/share/"
    cp -r "$srcdir/freeplane-${pkgver}/BIN" "$pkgdir/usr/share/$_pkgname"

    cd "$pkgdir/usr/share/$_pkgname"
    rm *.exe *.bat

    mkdir -p "$pkgdir"/usr/bin

    install -Dm755 "$srcdir/freeplane.run" "$pkgdir/usr/bin/freeplane"
    install -Dm644 "$srcdir/freeplane.desktop" "$pkgdir/usr/share/applications/freeplane.desktop"
    
    install -Dm644 "$pkgdir/usr/share/$_pkgname/freeplane.svg" "$pkgdir/usr/share/pixmaps/freeplane.svg"
    install -Dm644 "$pkgdir/usr/share/$_pkgname/freeplane.png" "$pkgdir/usr/share/pixmaps/freeplane.png"
    mkdir -p "$pkgdir/usr/share/doc"
    cp -r "$pkgdir/usr/share/$_pkgname/doc" "$pkgdir/usr/share/doc/$_pkgname"
}
