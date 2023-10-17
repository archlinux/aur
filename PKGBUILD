# Maintainer:       zzjzxq33 <wojiushixxx at 126 dot com>
# Co-Maintainer:    Misaka13514 <Misaka13514 at gmail dot com>
pkgname=bbg
pkgver=20231016
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
depends=('electron')
conflicts=("${pkgname}-git")
source=(
    'icon.png'::'https://github.com/bbg-contributors/bbg-resources/raw/753cf6fef826616425d32d51fa64541869fcf12c/icon.png'
    "app-${pkgver}.asar"::"${url}/releases/download/${pkgver}/app.asar"
)
sha256sums=('f25a9595d339f61193a7e79c08c5f56014fa487a6ddee271d0785bb1cae2155f'
            '82ef0ae4afcfd56a29cce3af0f181bd7d1530c755dc5991bfc54a9a42992bbbf')

package() {
    cd "$srcdir"
    install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/lib/${pkgname}/app.asar"
    install -Dm644 "icon.png"           "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -Dm755 "/dev/stdin"         "${pkgdir}/usr/bin/${pkgname}" << "EOF"
#!/bin/sh

exec electron /usr/lib/bbg/app.asar "$@"
EOF
    install -Dm644 "/dev/stdin"         "${pkgdir}/usr/share/applications/${pkgname}.desktop" << "EOF"
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
