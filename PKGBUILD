# Maintainer: Yage
_pkgbase=legion-thinkbook16p-gen5-sound-fix
pkgname=${_pkgbase}-dkms
pkgver=1
pkgrel=1
pkgdesc="DKMS package to fix internal speakers for Legion Thinkbook 16P 2024"
arch=(any)
url="https://alampy.com/2024/04/19/use-dkms-to-patch-linux-kernel-mod/"
license=('GPL2')
depends=(dkms curl libarchive)
makedepends=()

source=('dkms-patchmodule.sh'
        'dkms.conf'
        'thinkbook16p-gen5-fix.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        install -Dm644 "${src}" "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/${src}
    done
    install -Dm755 dkms-patchmodule.sh "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms-patchmodule.sh
}
