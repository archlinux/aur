# Maintainer: nl6720 <nl6720@gmail.com>

[[ "$CARCH" == 'x86_64' ]] && _ARCH_SUFFIX='x64'

pkgname='shim-signed'
pkgver='13.f0.7'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments'
url='https://apps.fedoraproject.org/packages/shim-signed'
arch=('x86_64')
license=('BSD')
options=('!strip')
source_x86_64=("https://kojipkgs.fedoraproject.org/packages/${pkgname}/${pkgver//.f/\/}/${CARCH}/shim-${_ARCH_SUFFIX}-${pkgver//.f/-}.${CARCH}.rpm")

sha512sums_x86_64=('e3b6baecf012ea4009e8d86c0151c4d38f0dc1741201480a81420ae78defac5d04a327ed1b0099a20b6843f460bab69bb5fde416e2c82c4a3b1b4eb8189b3b45')

package() {
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/shim${_ARCH_SUFFIX}.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/fedora/mm${_ARCH_SUFFIX}.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/boot/efi/EFI/BOOT/fb${_ARCH_SUFFIX}.efi"

	# Symlink old filenames
	ln -s "shim${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/shim.efi"
	ln -s "mm${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/MokManager.efi"
	ln -s "fb${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/fallback.efi"
}
