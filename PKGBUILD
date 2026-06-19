# Maintainer: KlapkiSzatana
pkgname=archive-app-bin
_pkgname=archive-app
pkgver=1.3.1
pkgrel=6
pkgdesc="Zarządzanie Domowymi Dokumentami"
arch=('x86_64')
url="https://github.com/KlapkiSzatana/archive-app"
license=('GPL-3.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
options=('!strip' '!debug')

source=("https://github.com/KlapkiSzatana/archive-app/releases/download/v${pkgver}/ArchiveApp_linux.tar.gz")

sha256sums=('a8e378786a577d1638c0569db1d0c6e8c3b6b3e8a6ac8c5c17f075e60cff681a')

package() {

    cd "$srcdir/linux-package"

    install -d "${pkgdir}/opt/ArchiveApp"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/applications"

    cp -r archive-app-linux "${pkgdir}/opt/ArchiveApp/"
    cp archive.png "${pkgdir}/opt/ArchiveApp/"
    cp ArchiveApp.desktop "${pkgdir}/opt/ArchiveApp/"

    chmod +x "${pkgdir}/opt/ArchiveApp/archive-app-linux/archive-app-linux"

    install -m644 archive.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    cat <<EOF > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
exec /opt/ArchiveApp/archive-app-linux/archive-app-linux "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=Home Archive
Name[pl]=Domowe Archiwum
Comment=Management of home documents
Comment[pl]=Zarządzanie Domowymi Dokumentami
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Office;Utility;
StartupWMClass=archive-app-linux
StartupNotify=true
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
