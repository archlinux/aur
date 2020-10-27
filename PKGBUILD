# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.6.0
pkgrel=1
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://github.com/electrickite/mkinitcpio-tpm2-encrypt"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools>=4.0')
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5157ecdba2d4b8c11f21b78c513f227cafccded69f6c71c92523fda5b49c351a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm644 install_tpm2 "${pkgdir}/usr/lib/initcpio/install/tpm2"
    install -Dm644 install_sd_tpm2 "${pkgdir}/usr/lib/initcpio/install/sd-tpm2"
    install -Dm644 tpm2-unseal.service "${pkgdir}/usr/lib/systemd/system/tpm2-unseal.service"
    install -Dm644 tpm2-cleanup.service "${pkgdir}/usr/lib/systemd/system/tpm2-cleanup.service"
    install -Dm755 hook_tpm2 "${pkgdir}/usr/lib/initcpio/hooks/tpm2"
    install -Dm755 tpm2_encrypt_hook "${pkgdir}/usr/bin/tpm2_encrypt_hook"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
