# Maintainer: Patryk Jaworski <regalis@regalis.com.pl>

pkgname=mkinitcpio-squashfs-git
pkgver=0.2.r1.1faca52
pkgrel=1
pkgdesc="SquashFS root support for mkinitcpio (local and remote image locations supported)"
arch=("any")
url="https://github.com/RegalisTechnologies/mkinitcpio-squashfs"
license=("GPL3")
depends=("pv" "wget" "mkinitcpio" "findutils")
makedepends=("git")
optdepends=("mkinitcpio-nfs-utils: downloading SquashFS images from remote locations")
conflicts=("mkinitcpio-squashfs")
source=("git+https://github.com/RegalisTechnologies/mkinitcpio-squashfs.git")
md5sums=('SKIP')
_gitname=mkinitcpio-squashfs

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	VERSION="$(git describe --long --tags 2>/dev/null| sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	if [[ -n "$VERSION" ]]; then
		echo ${VERSION}
	else
		printf "%s" "0.0.1.`git log --format='%H' -n 1 | cut -c -10`"
	fi
}

package() {
	cd "${_gitname}"
	make install DESTDIR="${pkgdir}"
}
