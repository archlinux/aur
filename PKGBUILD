# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: misaka10987 <misaka10987@outlook.com>
pkgname=inkscape-appimg
pkgver=1.4.2
pkgrel=2
epoch=
pkgdesc=""
arch=('x86_64')
url="https://inkscape.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('inkscape')
conflicts=()
replaces=()
backup=()
# Symbol stripping breaks AppImage
options=(!strip)
install=
changelog=
source=(
    "inkscape.appimage::https://inkscape.org/gallery/item/56343/Inkscape-ebf0e94-x86_64.AppImage"
)
noextract=(
    'inkscape.appimage'
)
sha256sums=(
    '99c333c03ce77e207942ddcd5c8a5b77cde89959a23651bc7872ae880cf4ba6b'
)
validpgpkeys=()

prepare() {
    chmod +x ./inkscape.appimage
    echo 'Extracting AppImage'
    ./inkscape.appimage --appimage-extract > /dev/null
}

build() {
    cp ./squashfs-root/usr/share/applications/org.inkscape.Inkscape.desktop ./inkscape.desktop
    cp -r ./squashfs-root/usr/share/icons .
}

check() {
    :
}

package() {
    install -Dm755 "$srcdir/inkscape.appimage" "$pkgdir/usr/bin/inkscape"
    install -Dm644 "$srcdir/inkscape.desktop" "$pkgdir/usr/share/applications/inkscape.desktop"
    cp -Tr "$srcdir/icons" "$pkgdir/usr/share/icons"
    chmod 755 -R "$pkgdir/usr/share/icons"
}
