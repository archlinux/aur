# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: ajs124 < ajs ÄT online DÖT de >

pkgname=ocztoolbox
pkgver=4.9.0.634
pkgrel=4
pkgdesc="The OCZ Toolbox is designed to update firmware and BIOS, secure erase, view SMART attributes, and view drive details of your OCZ SSD with the click of a button."
arch=('i686' 'x86_64')
url="http://ocz.com/consumer/download/firmware"
license=('custom:OCZ EULA')
depends=('libxrender' 'fontconfig' 'libxext')
depends_i686=('libsm')
optdepends=('polkit: to run OCZToolbox directly from menu')
source=("http://url.muflone.com/${pkgname}-${pkgver}_linux.tar.gz"
        "http://url.muflone.com/${pkgname}-user_guide-${pkgver%.*}.pdf"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "LICENSE"
        "${pkgname}_polkit"
        "org.archlinux.pkexec.${pkgname}.policy")
sha256sums=('7ef447dd08706d3065c522787f287e702b29ff9f9de4e07baf5ac0f456b9a140'
            '2552c53b3b21ad2e44be532a5d19e03c0b6c3c43a9353c33e76d13e6398fbb9a'
            'ce08e0c547b7fea09276d204a64ff83a3dee61ce1efded1384167c15d6a53ff0'
            'a5bab72e67578ceabf29e081063b00b1e1c3c2b9419fcbf888f3c24e65cf1035'
            '499875ee918c6163fefcb1056e2c179945f923a59c8093530bd12f7088a6c8a8'
            '1b12abcd995037834b2777e6acc6b598ca571379e4d2f443b59f4d4f8a9ba45b'
            '28ee6a363cfdb1128673cc954a7e84d4a96223f869efb8608fd45e964d61f36f')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        _source_arch="64"
    else
        _source_arch="32"
    fi

    install -m 755 -D "OCZToolbox_v${pkgver}_linux/linux${_source_arch}/OCZToolbox" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -m 644 -D ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install policy file
    install -m 755 -d "${pkgdir}/usr/share/polkit-1/actions"
    install -m 644 -t "${pkgdir}/usr/share/polkit-1/actions" "org.archlinux.pkexec.${pkgname}.policy"
    # Install launcher script
    install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}_polkit"
    # Install user guide
    install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-user_guide-${pkgver%.*}.pdf"
}
