# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update-bin
pkgver=4.0.2
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
source=("arch-update-bin-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" 'packer')
sha256sums=('2eaab7fb5d7bd39b52c8ff0e88406942751f346dffb4de45aee06bc8af3478eb')

prepare() {
	cd "arch-update-bin-${pkgver}"
	make clean
}

build() {
	sudo "$srcdir/packer"
	cd "arch-update-bin-${pkgver}"
	make
}

check() {
	cd "arch-update-bin-${pkgver}"
	make test
}

package() {
	cd "arch-update-bin-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}

