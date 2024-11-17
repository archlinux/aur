# Maintainer: allddd <allddd (at) proton (dot) me>

pkgname=mkinitcpio-extras
pkgver=1
pkgrel=1
pkgdesc='Collection of mkinitcpio hooks for busybox based initramfs'
arch=('any')
url='https://gitlab.com/allddd/mkinitcpio-extras'
license=('GPL-2.0-only')
depends=('mkinitcpio')
optdepends=(
    'mkinitcpio-nfs-utils: for netconf'
    'dropbear: for dropbear'
)
conflicts=(
    'mkinitcpio-netconf'
    'mkinitcpio-dropbear'
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('08817c88f6d6ad94c8d80564c8ac2eeb8414f4a86cb352585075e357b6648ff7')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    for NAME in $(find * -type d); do
        install -Dm644 "./${NAME}/${NAME}_hook" "${pkgdir}/usr/lib/initcpio/hooks/${NAME}"
        install -Dm644 "./${NAME}/${NAME}_install" "${pkgdir}/usr/lib/initcpio/install/${NAME}"
    done
}

# vim: ts=4 sw=4 et:
