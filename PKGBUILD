# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.6.1
pkgrel=1
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://github.com/electrickite/mkinitcpio-tpm2-encrypt"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools>=4.0')
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1fd35b539ea68f09913471a6fe7f99cc2b6aa6bdabdb87c9625c0a192e90650a')

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
