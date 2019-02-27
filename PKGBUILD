# Maintainer: Philipp Born <philipp@tamcore.eu>
# Contributor: Max Roder <maxroder@web.de>

pkgname='grub-imageboot'
pkgver='0.6'
pkgrel='2'
pkgdesc="grub2 script to automatically add boot entries for iso images placed in /boot/images/"
url="https://launchpad.net/ubuntu/+source/grub-imageboot/"
arch=('any')
license=('GPL')
depends=('syslinux' 'grub')
install='grub-imageboot.install'
_commit='529ac5d2bf91e7da8c31b9e15f37702127bddc1c'
source=("https://raw.githubusercontent.com/formorer/grub-imageboot/${_commit}/bin/60_grub-imageboot"
        "https://raw.githubusercontent.com/formorer/grub-imageboot/${_commit}/etc/grub-imageboot")
sha256sums=('462a9720ffa13ea9378bc485ecc1a88cbee59534a256627e9ba4ce029ed61b39'
            '12602cea7b5d5b434007b891730a5071c3d2a06ed1cc225932e91d8a5d1f6c20')

package() {
	cd "${srcdir}"

	# patch file
	sed -i 's/\/usr\/lib\/grub/\/usr\/share\/grub/g' 60_grub-imageboot

	install -Dm755 60_grub-imageboot ${pkgdir}/etc/grub.d/60_grub-imageboot
	install -Dm644 grub-imageboot ${pkgdir}/etc/default/grub-imageboot
	install -d ${pkgdir}/boot/images
}

# vim:set ts=2 sw=2 et:
