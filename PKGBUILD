# Maintainer: Ainola
# Contributor:  Felix Berkenkamp      <felix1012 at gmx.de>

pkgname=creeper-world3
pkgver=208
pkgrel=2
pkgdesc="Creeper World 3: Arc Eternal is the third installment in the Creeper World Series."
arch=('i686' 'x86_64')
url="http://knucklecracker.com/creeperworld3/cw3.php"
license=('custom')
depends=('glu' 'gtk2')
source=("http://knucklecracker.com/creeperworld3/patches/CreeperWorld3PATCH-${pkgver}-linux.tgz"
	    "${pkgname}.desktop"
        "${pkgname}.install")
sha256sums=('ad8f9c33f03c7ad32369b413a6b6a687828efea6c73e3df5d158b773c0ef7a5d'
            'b94de60d7001a17fd852937e33cf43a1e8c46cda21ac36ae9ac39808e8293aa7'
            'e6c9213ef87cd3b1e8b65e2cd24d2338e2b808e5bfe58154fa4364e597196ca8')
install=("${pkgname}.install")
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    # Launcher and Data
    mv "${srcdir}/CreeperWorld3/"* "$srcdir"
    install -Dm755 "${srcdir}/CW3.${_arch}" "${pkgdir}/opt/${pkgname}/CW3.${_arch}"
    mv "${srcdir}/CW3_Data" "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}/CW3_Data" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}/CW3_Data" -type f -exec chmod 644 {} \;

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/CW3.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/${pkgname}/CW3_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
