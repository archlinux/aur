# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(walk-git sor-git)
pkgbase=walk-sor-git
_reponame=walk
pkgver=r12.70f7a8c
pkgrel=1
pkgdesc='Plan 9 style utilities to replace find'
arch=(x86_64)
url="https://github.com/google/$_reponame"
license=(Apache)
depends=(bash glibc)
makedepends=(git)
# provides=("${pkgbase%-git}")
# conflicts=("${pkgbase%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_reponame"
	make
}

package_walk-git() {
	depends=(glibc)
	pkgdesc='Recursively walks a directory, printing each path'
	cd "$srcdir/$_reponame"
	install -D -m755 walk    "$pkgdir/usr/bin/walk"
	install -D -m644 walk.1  "$pkgdir/usr/share/man/man1/walk.1"
}

package_sor-git() {
	arch=(any)
	depends=(bash)
	pkgdesc='Takes standard input, dropping lines for which a command fails'
	cd "$srcdir/$_reponame"
	install -D -m755 sor     "$pkgdir/usr/bin/sor"
	install -D -m644 sor.1   "$pkgdir/usr/share/man/man1/sor.1"
}
