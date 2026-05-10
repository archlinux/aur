# Maintainer: KlapkiSzatana
pkgname=serwis-app-bin
_pkgname=serwis-app
pkgver=2.3.2
pkgrel=1
pkgdesc="Proste Prowadzenie Serwisu (gotowa wersja binarna)"
arch=('x86_64')
url="https://github.com/KlapkiSzatana/serwis-app"
license=('GPL-3.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!strip' '!debug')

source=("https://github.com/KlapkiSzatana/serwis-app/releases/download/v${pkgver}/SerwisApp_linux.tar.gz")
sha256sums=('c90858a6807f8effb8a149ef4e4c4096a1ba4583c29001da6496be4b98ce4e47')

package() {
    cd "$srcdir/linux-package"

    install -d "${pkgdir}/opt/SerwisApp"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/applications"

    cp -r SerwisApp "${pkgdir}/opt/"
    cp serwisapp.png "${pkgdir}/opt/SerwisApp/"

    chmod +x "${pkgdir}/opt/SerwisApp/SerwisApp"

    install -m644 serwisapp.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    cat <<EOF > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
exec /opt/SerwisApp/SerwisApp "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=SerwisApp
GenericName=Proste Prowadzenie Serwisu
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Office;Utility;
StartupWMClass=SerwisApp
StartupNotify=true
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
