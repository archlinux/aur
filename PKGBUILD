# Maintainer: Artemii Sudakov <finziyr@yandex.ru>

pkgname="kesboot-git"
pkgver=1.6.r0.g4531557
pkgrel=1
pkgdesc='Script for automating work with EFI Kernel Stub (linux)'
arch=('any')
url="https://github.com/BiteDasher/kesboot"
license=('MIT')
depends=('efibootmgr' 'sed' 'grep' 'util-linux' 'coreutils' 'binutils')
makedepends=('git')
source=("${pkgname}::git+https://github.com/BiteDasher/kesboot.git")
sha512sums=("SKIP")
backup=('etc/kesboot.conf')
options=(emptydirs)

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$srcdir/$pkgname"
	export pkgdir
	./install.sh makepkg
	install -Dm755 ./firstboot "$pkgdir"/usr/lib/setup-efi-boot
	install -Dm644 ./LICENSE "$pkgdir"/usr/share/licenses/kesboot/LICENSE
}
