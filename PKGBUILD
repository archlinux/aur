# Maintainer: Salamandar <felix@piedallu.me>

pkgname=geotortue4-bin
pkgver=3.14.02.19
pkgrel=1
pkgdesc='Programmation LOGO'
arch=('any')
url="http://geotortue.free.fr"
license=('GPLv3')
groups=('math')
depends=(
  geotortue-bin
  'jre8-openjdk'
)
source=(
    'http://geotortue.free.fr/deploy/beta/geotortue-4.17.11.04-beta.jar'
)
sha256sums=(
    '3e09b6460fa3f60694afdfac06f2c677dfc9910f4e9bbfc934f555218084423a'
)

package() {
    install -d "${pkgdir}/usr/lib/"
    cp -r "/usr/lib/geotortue3" "${pkgdir}/usr/lib/geotortue4"
    rm "${pkgdir}/usr/lib/geotortue4/geotortue-3"*
    cp geotortue-4.17.11.04-beta.jar "${pkgdir}/usr/lib/geotortue4"

    install -d "${pkgdir}/usr/share/applications/"
    cat "/usr/share/applications/geotortue.desktop" \
    | sed 's|Geotortue3|Geotortue4|;s|/usr/bin/geotortue|/usr/bin/geotortue4|' \
    > "${pkgdir}/usr/share/applications/geotortue4.desktop"

    install -d "${pkgdir}/usr/bin"
    cat "/usr/bin/geotortue" \
    | sed 's|geotortue3/geotortue-3.*\.jar|geotortue4/geotortue-4.17.11.04-beta.jar|' \
    > "${pkgdir}/usr/bin/geotortue4"
    chmod +x "${pkgdir}/usr/bin/geotortue4"
}
