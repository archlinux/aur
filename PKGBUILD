# Maintainer: Artemiy Dudko <thepioh(at)zoho(dot)com>

pkgname=socketwrench
pkgver=0.0.1
pkgrel=1
pkgdesc="Socket Wrench is to Websockets what Postman/Insomnia is to HTTP connections (kinda)."
arch=('x86_64')
url="https://asleepysamurai.com/articles/socketwrench"
license=('custom')
# depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'xdg-utils')
# optdepends=('libappindicator-gtk3: Systray indicator support'
#             'org.freedesktop.secrets: Keyring password store support')
source=("https://asleepysamurai.com/articles/socketwrench/binary/SocketWrench-${pkgver}-setup.deb")
noextract=("SocketWrench-${pkgver}-setup.deb")
sha256sums=('bcd2dd48a953ff649999ff28bc4fb4b62e4f2f248e74c627332607d554c1d19b')

package() {
    bsdtar -O -xf "SocketWrench-${pkgver}-setup.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
    
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "../../opt/Socket Wrench/socketwrench" "${pkgdir}/usr/bin/socketwrench"
    # # Move license
    # install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    # mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    # ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
