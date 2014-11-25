# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=prey
pkgver=02192009
pkgrel=1
pkgdesc='Prey is a first person shooter based on the id Tech 4 engine using portals and variable gravity. You need the retail game files to play.'
arch=('i686' 'x86_64')
url='http://icculus.org/prey/'
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-libstdc++5' 'lib32-libxext' 'lib32-openal' 'lib32-sdl')
else
    depends=('libstdc++5' 'libxext' 'openal' 'sdl')
fi
makedepends=('unzip')
install='prey.install'
source=(
    'prey.desktop' 'prey.launcher'
    "http://icculus.org/prey/downloads/${pkgname}-installer-${pkgver}.bin"
)
sha256sums=('ca4d750e33bfb3fc2307e7a3ac1469cba352d976b14a84e1d9717298a7821181'
            '68eaf10487830efba839da84ad3db93abfe5b9bb2ba31facd9d9d1b8c3223bf5'
            'b3d06fc51afbb5dc88d7e0f9d5267cd9d171edf9d18c84c5f66c8172da74b357')

package() {
    # Create Destination Directory
    install -d "${pkgdir}/opt/prey/"

    # Install Game Files
    cp -r "${srcdir}/data/prey-linux-x86/"* \
        "${pkgdir}/opt/prey/"

    # Install Data Files
    cp -r "${srcdir}/data/prey-linux-data/"* \
        "${pkgdir}/opt/prey/"

    # Install Punkbuster Files
    cp -r "${srcdir}/data/punkbuster-linux-x86/"* \
        "${pkgdir}/opt/prey/"

    # Install Default Config
    cp "${srcdir}/data/configs/english.cfg" \
        "${pkgdir}/opt/prey/base/default.cfg"

    # Install License (Prey)
    install -D -m 0644 "${srcdir}/data/prey_license.txt" \
        "${pkgdir}/usr/share/licenses/$pkgname/prey_license.txt"

    # Install License (Punkbuster)
    install -D -m 0644 "${srcdir}/data/punkbuster_license.txt" \
        "${pkgdir}/usr/share/licenses/$pkgname/punkbuster_license.txt"

    # Install Desktop Shortcut
    install -D -m 0644 "${srcdir}/prey.desktop" \
        "${pkgdir}/usr/share/applications/prey.desktop"

    # Install Client Launcher
    install -D -m 0755 "${srcdir}/prey.launcher" \
        "${pkgdir}/usr/bin/prey"
}

