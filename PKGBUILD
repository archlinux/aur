# Maintainer: Ainola
# Contributor:  Felix Berkenkamp

pkgname=creeper-world3
pkgver=212
pkgrel=3
pkgdesc="This is what happens when cellular automata takes over a strategy simulation."
arch=('x86_64')
url="http://knucklecracker.com/creeperworld3/cw3.php"
license=('custom')
depends=('glu' 'gtk2')
makedepends=('gendesk')
source=("http://knucklecracker.com/creeperworld3/patches/CreeperWorld3PATCH-${pkgver}-linux.tgz"
        "${pkgname}.sh")
sha256sums=('78f1b45b4771114309abd23fbcbfd0ff6bf4ecdcbfbaf0da3213af48ce71672d'
            '8fc47f2d6736714e7444d9c10f427bc649a1f2b5fcb04e568600ce61cf575276')
# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare() {
    gendesk -n ../PKGBUILD
}

package() {
    # Launcher and Data
    install -Dm755 "CW3.x86_64" "$pkgdir/opt/$pkgname/CW3.x86_64"
    cp -a CW3_Data "$pkgdir/opt/$pkgname/"
    find "${pkgdir}/opt/${pkgname}/CW3_Data" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}/CW3_Data" -type f -exec chmod 644 {} \;

    # Install Binaries/Launchers
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Integration
    install -Dm644 CW3_Data/Resources/UnityPlayer.png \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
