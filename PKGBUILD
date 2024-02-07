# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.10.1
pkgrel=2
pkgdesc="An update notifier/applier that assists you with important pre/post update tasks."
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL-3.0-or-later')
depends=('pacman-contrib' 'curl' 'htmlq' 'diffutils')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'flatpak: Flatpak support'
	    'libnotify: Desktop notification support'
	    'vim: Default merge program for pacdiff'
	    'sudo: Privilege elevation'
	    'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"fix_flatpak_updates_detection.patch::https://github.com/Antiz96/arch-update/commit/ec8a61c1add94877cce05f73b3ea9cf83f354b1a.patch")
sha256sums=('4cc4ccee9af80ec347c2d444e1ae43ce323cd05fd13d0d750f886fa190a78c85'
            '029d84a448592287c5d3660a894fc23b0b32d251d97ccbb884760add0a59cbc6')

prepare() {
	cd "${pkgname}-${pkgver}"
	# Temporary patch to make the Flatpak packages updates detection more robust and avoid eventual false positives
	# See https://github.com/Antiz96/arch-update/pull/104
	patch -Np1 <"${srcdir}/fix_flatpak_updates_detection.patch"
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
