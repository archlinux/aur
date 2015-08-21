# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Max Roder <maxroder@web.de>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=grml-rescueboot
pkgver=0.4.6
pkgrel=1
pkgdesc="grub2 script to add grml iso images to the grub2 boot menu"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=(any)
license=(GPL)
depends=(grub)
install="${pkgname}.install"
source=("http://deb.grml.org/pool/main/g/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('5880a292a4f53116cb5da44f422b08a929889e3ea900858841c9448f33c01fca')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# adjust path of grub-mkconfig_lib
	sed -i 's/${libdir}\/grub/${prefix}\/share\/grub/g' 42_grml

	install -Dm755 42_grml ${pkgdir}/etc/grub.d/42_grml
	install -Dm644 etc/default/${pkgname} ${pkgdir}/etc/default/${pkgname}
	install -d ${pkgdir}/boot/grml
}
