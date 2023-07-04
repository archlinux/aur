# Maintainer:       zzjzxq33 <wojiushixxx at 126 dot com>
# Co-Maintainer:    Misaka13514 <Misaka13514 at gmail dot com>
pkgname=bbg
pkgver=20230505
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
depends=('electron')
conflicts=("${pkgname}-git")
source=(
    'icon.png'::'https://github.com/bbg-contributors/bbg-resources/raw/30dfd1cbdfbed040a74f05b0312302f3bf0c1c85/icon.png'
    "app-${pkgver}.asar"::"${url}/releases/download/${pkgver}/app.asar"
)
sha256sums=('d5f8f191d914a140ab11999a176b226523dd78e6865a75b483013846503a5228'
            'f008944d679559e99b31815df62fb424cef9ac4de2c5c336c82f443e769df35a')

package() {
    cd "$srcdir"
    install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/lib/${pkgname}/app.asar"
    install -Dm644 "icon.png"           "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -Dm755 "/dev/stdin"         "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh

exec electron /usr/lib/bbg/app.asar "\$@"
EOF
    install -Dm644 "/dev/stdin"         "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=bbg
Comment=blog generator
Keywords=
Exec=/usr/bin/bbg
TryExec=
Terminal=false
Icon=/usr/share/icons/bbg.png
Type=Application
StartupNotify=false
Categories=Office
EOF
}
