# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atom-ng-bin
pkgver=1.66.10
pkgrel=1
pkgdesc="The hyper-hackable text editor. Community maintained fork with compiler optimizations."
arch=('x86_64')
url="https://thorium.rocks/atom-ng/"
_githuburl="https://github.com/Alex313031/atom-ng"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-ng-bin}")
depends=('nspr' 'perl' 'libxdamage' 'at-spi2-core' 'glib2' 'libxcomposite' 'sh' 'gtk3' 'glibc' 'curl' 'libxfixes' 'dbus' 'nss' 'python' 'alsa-lib' 'libxext' \
    'libxrandr' 'gcc-libs' 'nodejs' 'libdrm' 'openssl-1.1' 'libsecret' 'pango' 'libxkbfile' 'expat' 'python-setuptools' 'gdk-pixbuf2' 'libxcb' 'zlib' 'libx11' \
    'cairo' 'libxkbcommon' 'mesa' 'libxshmfence' 'libcups' 'git')
makedepends=('gendesk')
options=(!strip)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/Atom-ng_${pkgver}_amd64.zip")
sha256sums=('6967ae2935240f20d1a040f764919b12b82c8ef8a3a1b8fd7aa40a980a34cecb')
  
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "TextEditor;Development;IDE;Utility" --name "Atom-ng" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    chmod 0755 "${pkgdir}/opt/${pkgname%-bin}/chrome-sandbox"
    find "${pkgdir}/opt/${pkgname%-bin}/WidevineCdm" -type f -exec chmod 644 {} \;
}