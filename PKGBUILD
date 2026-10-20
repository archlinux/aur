# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291

pkgname='preloader-signed-bin'
pkgver='20130208'
pkgrel='1'
pkgdesc='Linux Foundation UEFI secure boot system (prebuilt X64 EFI binaries)'
url='https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/'
arch=('any')
license=('GPL' 'LGPL2.1')
options=('!strip')
_preloader_checksum=$(curl -s "${url}" | grep "PreLoader.efi" | grep -oP 'md5sum \K[a-f0-9]{32}')
_hashtool_checksum=$( curl -s "${url}" | grep "HashTool.efi"  | grep -oP 'md5sum \K[a-f0-9]{32}')
source=(
    'https://blog.hansenpartnership.com/wp-uploads/2013/PreLoader.efi'
    'https://blog.hansenpartnership.com/wp-uploads/2013/HashTool.efi'
)
md5sums=(
    "${_preloader_checksum}"
    "${_hashtool_checksum}"
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/PreLoader.efi"
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/HashTool.efi"
}
