# Maintainer: Sander Smid <sander..smid@gmail.com>
pkgname=stencyl
pkgver=3.3.3
pkgrel=5
pkgdesc='Create amazing games without code'
arch=(i686 x86_64)
url=http://www.stencyl.com
license=(custom)
#depends=()
#makedepends=()
#conflicts=()
#provides=()
options=('!strip')
#install=
source=(stencyl
        stencyl.desktop
        stencyl.png
        LICENSE)
md5sums=('e97ff31637ae4f223062269bfce3f8ab'
         'db8e44b1c3a6b5402ae1d6f3aec551d2'
         'c99ae55db267e86c0936e01662ee12ea'
         '986e231db4a39dd7fa59c93a7e06b7c2')

[ "$CARCH" = "i686" ]   && {
    source+=("${pkgname}-linux.tar.gz::http://www.stencyl.com/download/get/lin32/")
    md5sums+=('d539bf55deca4bcb90e5f44ef245f410')
}
[ "$CARCH" = "x86_64" ] && {
    source+=("${pkgname}-linux.tar.gz::http://www.stencyl.com/download/get/lin64/")
    md5sums+=('025f200d90a5ecf9c681f00dc193a58a')
}

noextract=("$pkgname.tar.gz")

package() {
    # Uncompress the source into the final directory
    install -Ddm755 "$pkgdir"/usr/share/stencyl
    tar -xzf "$srcdir/${pkgname}-linux.tar.gz" -C "$pkgdir"/usr/share/stencyl/

    # Install the custom launch script, the .desktop and the icon
    install -Dm755 "$srcdir/stencyl" "$pkgdir/usr/bin/stencyl"
    install -Dm755 "$srcdir/stencyl.desktop" "$pkgdir/usr/share/applications/stencyl.desktop"
    install -Dm644 "$srcdir/stencyl.png" "$pkgdir/usr/share/pixmaps/stencyl.png"

    # Install the license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
