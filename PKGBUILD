pkgname=arch-os-manager
pkgver=r101.8eb8633
pkgrel=1
pkgdesc="Arch OS System Manager"
arch=('any')
url="https://github.com/murkl/arch-os-manager"
license=('GPL2')
depends=('base-devel' 'pacman-contrib')
optdepends=('ttf-firacode-nerd: Install and set font icons that are used to display information' 'libnotify: Add notification support' 'paru: Add support for AUR packages' 'flatpak: Add support for Flatpak packages' 'reflector: Add support for refresh mirrorlist' 'downgrade: Add support for donwgrade system packages' 'meld: Add support for merge pacdiff configurations' 'xdg-utils: Add support for open news in browser' 'gnome-shell-extensions: Add support for GNOME Extensions')
makedepends=('git')
source=(arch-os.desktop $pkgname::git+$url.git)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"
	cp -rf "${srcdir}/${pkgname}/"* "$pkgdir/opt/${pkgname}/"
	cp -f arch-os.desktop "${pkgdir}/usr/share/applications/"
	chmod +x "${pkgdir}/opt/${pkgname}/arch-os"
	ln -s /opt/${pkgname}/arch-os "${pkgdir}/usr/bin/"
}
