# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=mkinitcpio-extras
pkgver=3
pkgrel=1
pkgdesc='Collection of mkinitcpio hooks for busybox based initramfs'
arch=('any')
url='https://gitlab.com/allddd/mkinitcpio-extras'
license=('GPL-2.0-only')
depends=('mkinitcpio')
optdepends=(
    'mkinitcpio-nfs-utils: required for netconf'
    'dropbear: required for dropbear'
    'tinyssh: required for tinyssh'
)
provides=(
    'mkinitcpio-netconf'
    'mkinitcpio-dropbear'
    'mkinitcpio-tinyssh'
)
conflicts=(
    'mkinitcpio-netconf'
    'mkinitcpio-dropbear'
    'mkinitcpio-tinyssh'
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2d76c5cea844448908d5b84d5739feb83e93bfa2d595ac34805651ac4593baa6')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    for NAME in */; do
        NAME=${NAME%/}
        install -Dm644 "./${NAME}/${NAME}_hook" "${pkgdir}/usr/lib/initcpio/hooks/${NAME}"
        install -Dm644 "./${NAME}/${NAME}_install" "${pkgdir}/usr/lib/initcpio/install/${NAME}"
    done
}

# vim: ts=4 sw=4 et:
