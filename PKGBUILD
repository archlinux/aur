# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname=neosu-bin
_pkgname=${pkgname%-bin}
pkgver=39.00
pkgrel=1
pkgdesc="Third-party McOsu fork, with additional features"
arch=(x86_64)
url="https://github.com/kiwec/neosu"
license=(GPL-3.0-only)
depends=(acl libmd libglvnd glu libxrender libxrandr libx11 \
        libxfixes libxext libxi libxdmcp libxau libxcb util-linux-libs)
options=(!strip) 
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/kiwec/neosu/releases/download/v$pkgver/neosu-linux-x64.tar.gz"
  "$_pkgname.png"
  "$_pkgname.desktop"
  "$_pkgname.sh"
)
sha256sums=('32a7b84b2c9f6907f90aa244232545261d1b155afa909f49b5141bb617b8f75b'
            'f74e0a47c46aa33c708211acef3f0140c63c904c09b7eb97410276eec403803c'
            '1df21f7ae373bd549a0f277e5988ec2ba5f7d70af6cfead98b37c4002c8d4ae9'
            '86b674bf648a0a5f78589e7913d670896edddd797ad23edcb9ca0ebefaabab77')

package() {
    cd "$srcdir"

    # Installing binaries
    install -dm755 "$pkgdir/opt/neosu"
    cp -a "$srcdir/neosu"/* "$pkgdir/opt/neosu/"
    chmod 755 "$pkgdir/opt/neosu/neosu"

    # Installing script
    install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/neosu"

    # Install pixmap and desktop files
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/neosu.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/neosu.desktop"
}
