# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=3.19.6
pkgrel=1
pkgdesc="An interactive update notifier & applier that assists you with important pre / post update tasks"
url="https://github.com/Antiz96/arch-update"
arch=('any')
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'pacman' 'pacman-contrib' 'archlinux-contrib' 'curl' 'fakeroot'
         'htmlq' 'diffutils' 'hicolor-icon-theme' 'python' 'python-pyqt6' 'qt6-svg' 'glib2' 'xdg-utils')
makedepends=('scdoc')
checkdepends=('bats')
optdepends=('paru: AUR Packages support'
            'yay: AUR Packages support'
            'pikaur: AUR Packages support'
            'flatpak: Flatpak Packages support'
            'libnotify: Desktop notifications support on new available updates'
            'alhp-utils: Check for ALHP build queue or outdated mirrors'
            'vim: Default diff program for pacdiff'
            'neovim: Default diff program for pacdiff if EDITOR=nvim'
            'sudo: Privilege elevation'
            'sudo-rs: Privilege elevation'
            'opendoas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cc3dc05a751cec71789ce30f135c8c7d38b6e53f238d7a7f5c2e1a90589a02e4')

prepare() {
	cd "${pkgname}-${pkgver}"
	make clean
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make test
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
