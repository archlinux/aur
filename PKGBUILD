# Maintainer: Denis Zheleztsov <difrex@lessmore.pw>
pkgname=booty-git
pkgver=20200716.163_a0721cf
pkgrel=1
pkgdesc="Create bootable GNU/Linux image with 3 steps!"
url="https://github.com/sp00f1ng/booty"
arch=('x86_64')
license=('GPL3')
depends=(
  'grub'
  'dosfstools'
  'libisoburn'
  'cpio'
  'squashfs-tools'
)
makedepends=(
	'make'
)
source=(
	"$pkgname::git+https://github.com/sp00f1ng/booty.git"
)
md5sums=('SKIP')

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
