# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=devtools-git
_pkgname=devtools
pkgver=20191212
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://git.archlinux.org/devtools.git/'
depends=('namcap' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial')
makedepends=('asciidoc' 'git')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=("$pkgname::git+https://git.archlinux.org/devtools.git")
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	git show -s --format=%ci HEAD^{commit}|awk '{print$1}'|sed 's,-,,g'
}

prepare() {
	cd ${pkgname}
}

build() {
	cd ${pkgname}
	make PREFIX=/usr
}

package() {
	cd ${pkgname}
	make PREFIX=/usr DESTDIR=${pkgdir} install
}
