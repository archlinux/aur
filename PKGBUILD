# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=devtools32-git
_pkgname=devtools
pkgver=20210225.1.r3.gff0c88c
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://github.com/archlinux32/devtools32'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
	 'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('git' 'asciidoc')
optdepends=('btrfs-progs: btrfs support')
provides=($_pkgname=${pkgver%%.r*})
conflicts=($_pkgname)
source=("$pkgname::git+https://git.archlinux32.org/archlinux32/devtools32.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

build() {
	cd ${pkgname}
	make PREFIX=/usr
}

package() {
	cd ${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
