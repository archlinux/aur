# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Ali H. Caliskan <ali.h.caliskan@gmail.com>
# Contributor: Xavier <shiningxc[at]gmail[dot]com>

pkgname=savage2
pkgver=2.1.1.1
pkgrel=2
pkgdesc="Savage 2: A Tortured Soul is an fantasy themed online multiplayer team-based FPS/RTS/RPG hybrid. Completely free as of December 2008."
arch=('x86_64')
url='http://savage2.com/'
license=('custom: "Savage 2"')
depends=('mesa' 'libxml2' 'glu')
makedepends=('unzip')
install=savage2.install
source=("https://savage2.net/downloads/Savage2-${pkgver}-linux-x64-installer.run" \
'savage2.launcher' 'savage2.desktop' 's2editor.desktop' 's2mviewer.desktop' 'savage2.sh')
md5sums=('4826a5db0a6f8c6e8add2176c11c49e2'
         'f08e9499ff5f10b5e5e98454aa595db5'
         'a6957bb87da35d58df86d84a6dca1479'
         'b082a33fd1a580d3c70d80bbbfb0bffe'
         '177155e2c2c4e1382ce9b1343e26b5c7'
         '4acf06412dbd5ebbec89d1c5f2c99b4f')
PKGEXT='.pkg.tar'

package() {
    cd "${srcdir}"

    # Installer name
    _installer_name="Savage2-${pkgver}-linux-x64-installer.run"

    # Create Destination Directory
    install -d "${pkgdir}/opt/savage2"

    # Make Installer Executable
    chmod +x "${srcdir}/${_installer_name}"

    # Run Installer
    "${srcdir}/${_installer_name}" --mode unattended --prefix "${pkgdir}/opt/savage2/"

    # Remove old libraries
    rm "${pkgdir}/opt/savage2/libs/libstdc++.so.6"

    # Install Game Script missing from 2.1.0.7
    install -D -m 755 "${srcdir}/savage2.sh" \
        "${pkgdir}/opt/savage2/savage2.sh"

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

