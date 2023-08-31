# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailmaster-bin
_pkgname=MailMaster
pkgver=5.0.2.1005
pkgrel=1
pkgdesc="专业的全平台邮箱客户端。一封邮件，多端同步。所有平台都能给你出色的体验。"
arch=('x86_64')
url="https://dashi.163.com"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('qt5-base' 'xcb-util-renderutil' 'libxdamage' 'libx11' 'xcb-util-image' 'alsa-lib' 'freetype2' 'libxcomposite' 'nspr' 'libsasl' \
    'expat' 'at-spi2-core' 'dbus' 'xcb-util-keysyms' 'zlib' 'libxrandr' 'glibc' 'bash' 'libxkbcommon' 'libxkbcommon-x11' 'nss' 'gconf' \
    'fontconfig' 'libdrm' 'xcb-util' 'libxfixes' 'libglvnd' 'xcb-util-wm' 'glib2' 'libxcb' 'mesa' 'libcups' 'libxext' 'pango' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.deb::https://res.126.net/dl/client/linuxmail/dashi/mail.deb"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "libnss-wrapper_1.1.11-1ubuntu2_amd64.deb::http://mirrors.kernel.org/ubuntu/pool/universe/n/nss-wrapper/libnss-wrapper_1.1.11-1ubuntu2_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('dfbcec01aa524ff9db7f03fbc3970a16702873753547076dce5929035b49e881'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            '6d023d6bc110c4d08efca9ba51196d2b92e61c1824caf47e28e073df681b1253'
            '3ee743a1b662cd6932854fc0729365fc1761b44d86731d12d91373e123b0f7b5')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}" --gname root --uname root
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}/usr/lib/x86_64-linux-gnu/libnss_wrapper.so" "${pkgdir}/opt/${_pkgname}"
    ln -s "/usr/lib/libsasl2.so.3.0.0" "${pkgdir}/opt/${_pkgname}/libsasl2.so.2"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/opt/${_pkgname}"
    sed "s|launch|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}