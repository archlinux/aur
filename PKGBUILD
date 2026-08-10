# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=4.2.2
pkgrel=1
pkgdesc="An interactive update notifier & applier that assists you with important pre / post update tasks"
url="https://github.com/Antiz96/arch-update"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'pacman' 'pacman-contrib' 'archlinux-contrib' 'curl' 'fakeroot' 'util-linux'
         'htmlq' 'diffutils' 'hicolor-icon-theme' 'glibc' 'libgcc' 'glib2' 'xdg-utils')
makedepends=('cargo' 'scdoc')
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
sha256sums=('725ea4b0887f3d725bf76cd63dad9c27791fb9c2e6b3f81a36837d1bd88791fa')

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
