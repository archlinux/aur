# Maintainer: nl6720 <nl6720@gmail.com>

[[ "$CARCH" == 'x86_64' ]] && _ARCH_SUFFIX='x64'

pkgname='shim-signed'
pkgver='13.f0.6'
pkgrel='2'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments.'
url='https://apps.fedoraproject.org/packages/shim-signed'
arch=('x86_64')
license=('BSD')
options=('!strip')
source=("https://kojipkgs.fedoraproject.org/packages/${pkgname}/${pkgver//.f/\/}/${CARCH}/shim-${_ARCH_SUFFIX}-${pkgver//.f/-}.${CARCH}.rpm")

sha512sums=('b7ad948793db8c466e7f923ccaa56969509995ee3389c8aa6d1d2e8a30b4bd9aae393c36e107421af44aa3a4cab7fe560517bccee6d5484dad6dd0c2b6d11c37')

package() {
	install -D -m0644 "${srcdir}/boot/efi/EFI/fedora/shim${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/shim${_ARCH_SUFFIX}.efi"
	install -D -m0644 "${srcdir}/boot/efi/EFI/fedora/mm${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/mm${_ARCH_SUFFIX}.efi"
	install -D -m0644 "${srcdir}/boot/efi/EFI/BOOT/fb${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/fb${_ARCH_SUFFIX}.efi"

	# Symlink old filenames
	ln -s "shim${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/shim.efi"
	ln -s "mm${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/MokManager.efi"
	ln -s "fb${_ARCH_SUFFIX}.efi" "${pkgdir}/usr/share/${pkgname}/fallback.efi"

}
