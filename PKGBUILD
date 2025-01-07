# Maintainer: MYT1 <MYT1 at QQ com>
pkgname=mailmaster
pkgver=5.0.2.1011
epoch=2
pkgrel=4
pkgdesc="专业的全平台邮箱客户端。一封邮件，多端同步。手机、Windows、Mac、Linux、网页端，
所有平台都能给你出色的体验。"
arch=('x86_64')
url="https://dashi.163.com"
_debdl="https://mirrors.sdu.edu.cn/spark-store-repository"
license=('LicenseRef-custom')
conflicts=("mailmaster-bin")
depends=(
    'libsasl'
    'gconf'
    'libxcb'
    'nss'
    'glibc'
    'libxinerama'
    # aur:
    'nss_wrapper' 
    'additional-base-lib'
)

options=('!strip' '!debug')
source=(
    "${_debdl}/store//network/mailmaster/${pkgname}_${pkgver}_amd64.deb"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
)
sha256sums=('d7c272d50798b4f0dc5279efba383e8f12decef19e434b144e07c3c26c25c58a'
            'd3dc6df916c1600e66a673b63f2346777421d6cbcdbaf4a9eb0d182054c8b6a5')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
    install -Dm755 "${pkgdir}/opt/mailmaster/launch.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgdir}/opt/mailmaster/logo.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"
    sed '9s/.*/Exec=mailmaster %U/g' -i "${pkgdir}/usr/share/applications/mailmaster.desktop"
    sed '6s/.*/Icon=mailmaster/g' -i "${pkgdir}/usr/share/applications/mailmaster.desktop"
    sed -i '$a\MimeType=message\/rfc822;x-scheme-handler\/mailto;text\/calendar;text\/vcard;text\/x-vcard;x-scheme-handler\/webcal;x-scheme-handler\/webcals;x-scheme-handler\/mid;' "${pkgdir}/usr/share/applications/mailmaster.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
