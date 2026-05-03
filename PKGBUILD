# Maintainer: Berke Oruc <berke@berkeos.dev>
# Generator: Sisyphus

pkgname=broslauncher
pkgver=1.1.0
pkgrel=1
pkgdesc="BrosLauncher - Virtual machine launcher for Bros OS testing with QEMU"
arch=('x86_64')
url="https://github.com/berkeoruc/BrosLauncher"
license=('MIT')
depends=('python' 'tk' 'qemu-system-x86')
optdepends=('bros-iso: Bros OS ISO image for virtual machine')
provides=('broslauncher')
source=('launcher.py'
        'schematic.py'
        'constants.py'
        'broslauncher.desktop'
        'broslauncher.png'
        'com.berkeos.broslauncher.appdata.xml')
noextract=()
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/broslauncher"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/metainfo"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    cat > "${pkgdir}/usr/bin/broslauncher" << 'WRAPPER'
#!/bin/bash
exec python3 /usr/share/broslauncher/launcher.py "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/broslauncher"

    cp launcher.py "${pkgdir}/usr/share/broslauncher/"
    cp schematic.py "${pkgdir}/usr/share/broslauncher/"
    cp constants.py "${pkgdir}/usr/share/broslauncher/"
    cp broslauncher.desktop "${pkgdir}/usr/share/applications/"
    cp broslauncher.png "${pkgdir}/usr/share/pixmaps/"
    cp com.berkeos.broslauncher.appdata.xml "${pkgdir}/usr/share/metainfo/"
    cp broslauncher.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/broslauncher.png"
}