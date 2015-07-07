# Maintainer:  Ainola
# Contributor: kozec <kozec at kozec dot com>

pkgname=minecraft-technic-launcher
pkgver=4.304
pkgrel=1
pkgdesc=("Choose from thousands of community-made Minecraft modpacks available on the Technic Platform.")
arch=('any')
license=('GPL2')
url=("http://www.technicpack.net/")
depends=('java-runtime' 'xorg-xrandr' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("http://launcher.technicpack.net/launcher${pkgver:0:1}/${pkgver:2}/TechnicLauncher.jar"
        "technic-launcher"
        "technic-launcher.desktop"
        "technic-launcher.install")
sha256sums=("0b9de40976f32bc3b3ebcc3cb3ccd7ea4c9347bdbe1ee2083c16adcef3745e1b"
            "bcf657996e45b436382f401457e35d834baa1e35c0c483e7918ab6f93a2252c1"
            "bfea4300dc48adeb726b49125d05b5e65ed368cf08910ced970b1f1c571c4ecd"
            "4e967927f460029e27efd8f2417d18e064d37dfbd3af82393402636f0dfbd095")
install=("technic-launcher.install")
package(){
    cd "$srcdir"
    install -D -m755 "${srcdir}/technic-launcher" "${pkgdir}/usr/bin/technic-launcher"
    install -D -m644 "${srcdir}/TechnicLauncher.jar" "${pkgdir}/usr/share/technic-launcher/technic-launcher.jar"

    # Desktop integration
    install -D -m644 "${srcdir}/technic-launcher.desktop" "${pkgdir}/usr/share/applications/technic-launcher.desktop"
    icotool -x -o "$srcdir" "${srcdir}/net/technicpack/launcher/resources/icon.ico"
    for size in 16 32 48 64; do
        install -D -m644 "${srcdir}/icon_"?"_${size}x${size}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/technic-launcher.png"
    done
}
