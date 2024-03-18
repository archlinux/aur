# Maintainer: nl6720 <nl6720@archlinux.org>
pkgname=digest-to-efi-sig-list
pkgver=r13.b9ff0c4
pkgrel=2
_commit='b9ff0c4758669ae3d900d7c83e7305a46e8077cc'
pkgdesc='Create an EFI signature list from a digest'
arch=('x86_64')
url='https://github.com/danielztolnai/vbios-secure-boot/tree/master/digest-to-efi-sig-list'
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('git' 'gnu-efi')
source=("git+https://github.com/danielztolnai/vbios-secure-boot.git#commit=${_commit}")
sha512sums=('f50ab1b9ba3218f06edb1bce32e3f42eb9c0d9092d728825d7c26fec2e4cacdf0f7d645c326969c4d060b5d0110d47e9a43a1ab45eb681054ec7717a88836f1f')

pkgver() {
	cd 'vbios-secure-boot'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd 'vbios-secure-boot/digest-to-efi-sig-list'
	make
}
package() {
	cd 'vbios-secure-boot/digest-to-efi-sig-list'
	install -Dm0755 'digest-to-efi-sig-list' -t "${pkgdir}/usr/bin/"
	install -Dm0644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm0644 'COPYING' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
