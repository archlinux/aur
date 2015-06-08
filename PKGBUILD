# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=the-great-work
pkgver=1.0.1
pkgrel=2
pkgdesc="The Great Work is a Nifflas game about an apprentice that is expected to return home with some gold."
arch=('i686' 'x86_64')
url="http://nifflas.ni2.se/?page=The+Great+Work"
license=('custom')
depends=('libvorbis' 'openal' 'python2' 'libxrandr' 'glu')
source=("${pkgname}.desktop")
source_i686+=(the-great-work32.tar.gz::"http://downloads.ni2.se/free/The%20Great%20Work%20101%2032bit.tar.gz")
source_x86_64+=(the-great-work64.tar.gz::"http://downloads.ni2.se/free/The%20Great%20Work%20101%2064bit.tar.gz")

sha256sums=("33f84e2f5c7f16b6051a70cd4057db6d5f95c667a5c1fa714bc0e3ae653ee2af")
sha256sums_i686=("2c0dcaa45378e757535c86e1fcb191041fe7f1fcdc5c4910bf0949feb5d775ca")
sha256sums_x86_64=("69d64d563432557ea9dcea285e47e2507ad404f67e8b181c7708d253fe98aa3a")

package() {
    # Launcher and Data
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv "${srcdir}/The Great Work/"* "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/run.sh"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/World/Encyclopedia/Arsenic.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/run.sh"
    chmod 755 "${pkgdir}/opt/${pkgname}/bin/The Great Work"
}
