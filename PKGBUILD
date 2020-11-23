# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>

pkgname=artix-silence-grub-theme-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Artix Silence: Grub Theme, Fork of arch-silence"
arch=('any')
url="https://github.com/fghibellini/arch-silence"
license=('GPL')
depends=('grub')
makedepends=('git')
conflicts=("arch-silence-grub-theme-git")
provides=("artix-silence-grub-theme")
md5sums=(
	'SKIP' # git repo
	'8ff2e03bd8f2d97278bfa91b3a91e470' # artix logo
)

source=(
	"git+https://github.com/fghibellini/arch-silence"
	"artix-logo.png"
)

prepare() {
	# Replace Arch logo with Artix logo
	mv artix-logo.png "$srcdir/arch-silence/theme/arch_logo.png"

	# Delete old theme directory
	sudo rm -rf /boot/grub/themes/arch-silence
}

package() {
	sudo cp -TR "$srcdir/arch-silence/theme" /boot/grub/themes/arch-silence
	sudo grub-mkconfig -o /boot/grub/grub.cfg
}
