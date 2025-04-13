# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=mkinitcpio-extras
pkgver=2
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
conflicts=(
    'mkinitcpio-netconf'
    'mkinitcpio-dropbear'
    'mkinitcpio-tinyssh'
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('7f541506eb07cb5d85e30da5a33e24ff59e21e7b9154624c23f884e3c6057aaf')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    for NAME in $(find * -type d); do
        install -Dm644 "./${NAME}/${NAME}_hook" "${pkgdir}/usr/lib/initcpio/hooks/${NAME}"
        install -Dm644 "./${NAME}/${NAME}_install" "${pkgdir}/usr/lib/initcpio/install/${NAME}"
    done
}

# vim: ts=4 sw=4 et:
