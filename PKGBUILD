# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=3.17.3
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
sha256sums=('59af930c6ab7b59537a89c0f80b70de623dd3c0b4ed04130599aef6b4d47d097')

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
