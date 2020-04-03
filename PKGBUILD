# Maintainer: Javier O. Cordero Pérez <javier@imaginary.tech>
pkgname=imaginary-teleprompter-bin
_pkgname=${pkgname%-bin}
pkgver=2.4.0
pkgrel=7
pkgdesc="A complete and professional free software teleprompter."
arch=('x86_64')
url="https://imaginary.tech/teleprompter"
license=('GPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 'gconf')
provides=('imaginary-teleprompter')
conflicts=('imaginary-teleprompter' 'imaginary-teleprompter-git')
install=INSTALL
changelog=
source=("${_pkgname}-${pkgver}.tar::https://github.com/ImaginarySense/Imaginary-Teleprompter-Electron/releases/download/2.4/${_pkgname}-${pkgver}.pacman")
sha256sums=('6d65527657bfc6f951d83d37676897aa80eff2902ffb061264cebc499d3b82ab')

package() {
    cd "$srcdir"

    # Place files
    install -d "${pkgdir}/opt/Imaginary/${_pkgname}"
    cp -a "${srcdir}/opt/Imaginary Teleprompter/"* "${pkgdir}/opt/Imaginary/${_pkgname}/"

    # Symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/Imaginary/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Edit desktop entry executable path
    sed -i "s/opt\/Imaginary Teleprompter/opt\/Imaginary\/${_pkgname}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    
    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/"
    cp -R "${srcdir}/usr/share/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}
