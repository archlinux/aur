# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=3.16.0
pkgrel=1
pkgdesc="An update notifier & applier that assists you with important pre / post update tasks"
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
            'vim: Default diff program for pacdiff'
            'neovim: Default diff program for pacdiff if EDITOR=nvim'
            'sudo: Privilege elevation'
            'sudo-rs: Privilege elevation'
            'opendoas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c2f78ca8eda3bcd0d07f9043763480453fe4db836e3fd7eb57c1b31e9a9ab539')

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
