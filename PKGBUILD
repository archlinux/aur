# Maintainer: Artemii Sudakov <finziyr@yandex.ru>

pkgname="kesboot-git"
pkgver="1.0"
pkgrel="2"
pkgdesc='Script for automating work with EFI Kernel Stub (linux)'
arch=('any')
url="https://github.com/BiteDasher/kesboot"
license=('MIT')
depends=('efibootmgr' 'sed' 'grep' 'util-linux' 'coreutils' 'binutils')
makedepends=('git')
source=("${pkgname}::git+https://github.com/BiteDasher/kesboot.git")
sha512sums=("SKIP")
pkgver() {
	git rev-parse --short HEAD
}
package() {
	cd "$srcdir/$pkgname"
	export pkgdir
	./install.sh makepkg
	install -Dm755 ./firstboot "$pkgdir"/usr/lib/setup-efi-boot
	install -Dm644 ./LICENSE "$pkgdir"/usr/share/licenses/kesboot/LICENSE
}
