# Maintainer: Vitor Hideysohi <vitor.h.n.batista@gmail.com>
pkgname=mkinitcpio-efi-copy
pkgver=1.0.0
pkgrel=1
pkgdesc="Mkinitcpio hook to upgrade efi kernel"
arch=("any")
license=("GPL-2.0-only")
depends=('mkinitcpio')
makedepends=('gettext')
source=(
    'kernel-efi-copy.template'
)
md5sums=('00e5a27e02f2d8cef8196a7678dbe173')


build() {
    cat "${srcdir}/kernel-efi-copy.template" | ESP_DIR_VALUE=${ESP_DIR:-"/boot/efi/EFI/arch/"} envsubst '$ESP_DIR_VALUE' > "${srcdir}/kernel-efi-copy"
}


package() {
    install -m755 -d "${pkgdir}/usr/lib/initcpio/post/"
    install -m755 "${srcdir}/kernel-efi-copy" "${pkgdir}/usr/lib/initcpio/post/kernel-efi-copy"
}
