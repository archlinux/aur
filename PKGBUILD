# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname='shim-signed-bin'
pkgver='16.1+fedora+10'
pkgrel='1'
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 and AA64 binaries from Fedora)'
url='https://koji.fedoraproject.org/koji/packageinfo?packageID=14502'
arch=('any')
license=('BSD-2-Clause')
options=('!strip' '!debug')
install="${pkgname}.install"
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source=("https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//+fedora+/\/}/x86_64/shim-x64-${pkgver//+fedora+/-}.x86_64.rpm"
        "https://kojipkgs.fedoraproject.org/packages/shim/${pkgver//+fedora+/\/}/aarch64/shim-aa64-${pkgver//+fedora+/-}.aarch64.rpm")
sha512sums=('7082a62e11481c9fc65e9fde3fa3beef25478fefd2593a434b361a9cb501c281f3c9b7fff1ce8d8c451a3826d58b7897a76e48e507c3c428161547c1bca91c80'
            '51f834eea5bfe8d652a506ecfbeeb129f9f40cb96d13a5726cd2c2c1753f76e302ec4dd1e39665a782d8cd434298f2a8aa9c05f7ba4b94afb831c68d228809f3')

package() {
	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname%-bin}/" "${srcdir}/usr/lib/efi/shim/${pkgver//+fedora+/-}/EFI/fedora/"{shim,mm}{x64,aa64}".efi"
	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname%-bin}/" "${srcdir}/usr/lib/efi/shim/${pkgver//+fedora+/-}/EFI/BOOT/fb"{x64,aa64}".efi"
}
