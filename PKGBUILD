# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>
pkgname=diskfile-git
pkgdesc="Expose a disk block device as a regular file (FUSE)"
pkgver=r19.5cb6875
pkgrel=1
provides=('diskfile')
arch=('i386' 'x86_64')
license=('Simplified BSD')
url="https://github.com/vasi/diskfile"
depends=('fuse')
source=("git+https://github.com/vasi/diskfile.git")
md5sums=('SKIP')
_gitname="diskfile"

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 diskfile "$pkgdir/usr/bin/diskfile"
}
