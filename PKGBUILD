# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update-git
_pkgname="${pkgname%-git}"
pkgver=4.0.0.r765.a55f8fe
pkgrel=1
pkgdesc="An interactive update notifier & applier that assists you with important pre / post update tasks (git version)"
url="https://github.com/Antiz96/arch-update"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'pacman' 'pacman-contrib' 'archlinux-contrib' 'curl' 'fakeroot' 'util-linux'
         'htmlq' 'diffutils' 'hicolor-icon-theme'  'glibc' 'libgcc' 'glib2' 'xdg-utils')
makedepends=('git' 'scdoc' 'cargo')
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
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	make clean
}

build() {
	cd "${_pkgname}"
	make
}

check() {
	cd "${_pkgname}"
	make test
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
