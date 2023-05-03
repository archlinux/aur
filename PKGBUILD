# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Ali H. Caliskan <ali.h.caliskan@gmail.com>
# Contributor: Xavier <shiningxc[at]gmail[dot]com>

pkgname=savage2
pkgver=2.1.1.1
pkgrel=2
pkgdesc="Savage 2: A Tortured Soul is an fantasy themed online multiplayer team-based FPS/RTS/RPG hybrid. Completely free as of December 2008."
arch=('x86_64')
url='https://savage2.com/'
license=('custom: "Savage 2"')
depends=('mesa' 'libxml2' 'glu' 'ncurses5-compat-libs')
makedepends=('unzip')
install=savage2.install
source=("https://savage2.net/downloads/Savage2-${pkgver}-linux-x64-installer.run" \
'savage2.launcher' 'savage2.desktop' 's2editor.desktop' 's2mviewer.desktop' 'savage2.sh')
sha512sums=('9a568b5886ac0c86cd5132ab04d35ed8715f029a00a072eed5916e75153fcd0fe6b25b75995f44aa0585569358442f1a592f6637dff6280d5519e8a7b354f8f7'
            '5beba717e612dba323bacedb73f2cddd3844f51fc5d1f93f490b3d8e1597e6f3f9e1606e22a6e2dc9d3555cbc85c09cc762f9a2a4036e9f9f245e11c937f5453'
            '4f4fc1ec350f6ce4ddcc9f32ae251e151f315df3a8964ec1a900fbbf22376a488e8bd4bd87e86889c93127919c9298362a1f979418a15653925766a6dc6b96c7'
            'e5b7353fdf13bcb8bb5cb0a77757ed35bf19375c0ae5fd6341c65a28d3282eeeb60ff6471f6b9da5923c20d850bfcd20967f2636f1b100b427f2c087ee580553'
            'e17db181b90d8fb30c106f3b745d0251dccfea04c3c67d7aa4e247eb069ca7acc71471a46581f50ced812bcf6ccbc72f8e3f109d170d4d7f44f369abe684470a'
            'cd64032cb56bac763cb7f19112b8f86f1e0a7439797f1e955f73b96ce2f9b874cfc68b4e3f7bcf06f8dddd9481a65cc7699627fd3014984702d129e9b017b314')
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

