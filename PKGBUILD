# Maintainer: Javier O. Cordero Pérez <javier@imaginary.tech>
pkgname=imaginary-teleprompter-bin
_pkgname=${pkgname%-bin}
pkgver=2.3.4
pkgrel=7
pkgdesc="A complete and professional free software teleprompter."
arch=('x86_64')
url="https://imaginary.tech/teleprompter"
license=('GPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libappindicator-sharp')
provides=('imaginary-teleprompter')
conflicts=('imaginary-teleprompter' 'imaginary-teleprompter-git')
install=INSTALL
changelog=
source=("${_pkgname}-${pkgver}.tar::https://github.com/ImaginarySense/Teleprompter-Electron/releases/download/${pkgver}/${_pkgname}-${pkgver}-64bit.pacman")
sha256sums=('32eaa1482376269df3cdc7a275ce750bfc95483fc4ee34323e8004fd3e60e667')

package() {
    cd "$srcdir"

    # Place files
    install -d "${pkgdir}/opt/Imaginary/${_pkgname}"
    cp -a "${srcdir}/opt/Imaginary Teleprompter/"* "${pkgdir}/opt/Imaginary/${_pkgname}/"

    # Symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/Imaginary/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/"
    cp -R "${srcdir}/usr/share/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"

    # Place license files
    for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
        install -Dm644 "${pkgdir}/opt/Imaginary/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
        rm "${pkgdir}/opt/Imaginary/${_pkgname}/${license}"
    done
    #install -Dm644 "${pkgdir}/usr/share/licenses/common/GPL3/license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
