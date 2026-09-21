# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Ali H. Caliskan <ali.h.caliskan@gmail.com>
# Contributor: Xavier <shiningxc[at]gmail[dot]com>

pkgname=savage2
pkgver=2.2.5.0
pkgrel=1
pkgdesc="Savage 2: A Tortured Soul is an fantasy themed online multiplayer team-based FPS/RTS/RPG hybrid. Completely free as of December 2008."
arch=('x86_64')
url='https://savage2.net/'
license=('LicenseRef-savage2')
depends=('mesa' 'glu' 'ncurses5-compat-libs')
makedepends=()
install=
source=('https://masterserver1.talesofnewerth.com/lr1/x86_64/latest/Savage2CE.tar.gz' \
'savage2.launcher' 'savage2.desktop' 's2editor.desktop' 's2mviewer.desktop')
b2sums=('be6f1718d4c4818ab7c3071461176e13d929abbf856aa4a8655fff8631f7408acf0afe3ebd52605998c9e7e4747ce3b093cf638778b3bae96b970ac1a5fe01b9'
        '51557c346c55a29a397d21b05e56e92c62fa2e296f20387d16f66a1fd1edf77d31650806b5d2593f1c35fb26a67e11fd7aa35b797fee4ee9ca3fc420a5fff00c'
        'c2976cfa829eac67ca76856983f284c2a9e9479657c20ee75a8a627c4f74b78c4da7baf4e92f447530ffe5514f5cade9be09f8c2c52a8cf91a8cd79aae34a3be'
        '8a7200cf07be782656ebec265c40fdfb3430e1d0147893aabd3e1b9635090c70f4f599fcfa1057d30e2be0c19bc684a3daea150aca07807798776a19702abfbb'
        '55ed67ed12cd2ecc568557a61adcbfc35cc363f1c5524931b74705293246125cc657b2ab5edece8f5c444f57656032352d4efea98e4a5efb391bce13ac79dba6')
noextract=("Savage2CE.tar.gz")
PKGEXT='.pkg.tar'

package() {
    cd "${srcdir}"

    # Create Destination Directory
    install -d "${pkgdir}/opt/savage2"

    # Extract upstream package into Destination Directory
    bsdtar -x -o -C "${pkgdir}/opt/savage2" -f "${srcdir}/Savage2CE.tar.gz"

    # Symlink ncurses5-compat library to savage directory
    ln -sf /usr/lib/libncurses++.so.5.9 "${pkgdir}/opt/savage2/libncurses.so.6"

    # Ensure Savage 2 is executable
    chmod +x "${pkgdir}/opt/savage2/savage2"

    # Install Game Launcher
    install -D -m 755 "${srcdir}/savage2.launcher" \
        "${pkgdir}/usr/bin/savage2"

    # Install Desktop File (Game Client)
    install -D -m 644 "${srcdir}/savage2.desktop" \
        "${pkgdir}/usr/share/applications/savage2.desktop"

    # Install Desktop File (Map Editor)
    install -D -m 644 "${srcdir}/s2editor.desktop" \
        "${pkgdir}/usr/share/applications/s2editor.desktop"

    # Install Desktop File (Model Viewer)
    install -D -m 644 "${srcdir}/s2mviewer.desktop" \
        "${pkgdir}/usr/share/applications/s2mviewer.desktop"

    # Install Icon
    install -D -m 644 "${pkgdir}/opt/savage2/s2icon.png" \
        "${pkgdir}/usr/share/pixmaps/savage2.png"

    # Install License
    install -D -m 644 "${pkgdir}/opt/savage2/license.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

