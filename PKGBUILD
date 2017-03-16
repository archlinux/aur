# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

# I *DO NOT* maintain the source repo.
# This package does not run the python build script to avoid trusting
# the git repo, but you should still inspect the package before installing.

pkgname=fortune-mod-g-git
_pkgname=gfortune
_filename=g
_sourcefile=gsource
pkgver=1.87ddd54
pkgrel=1
pkgdesc='Fortune quotes from /g/.'
arch=('any')
url="https://github.com/ketogenesis/$_pkgname.git"
license=('unknown')
install="$pkgname.install"
makedepends=('bsd-games') # for rot13
depends=('fortune-mod')
groups=('fortune-mods')
source=("git+https://github.com/ketogenesis/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf '1.%s' "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	rot13 < "$_sourcefile" > "$_filename"
	strfile -x "$_filename" "$_filename.dat"
}

package() {
	install -D -m644 "$srcdir/$_pkgname/$_filename" "$pkgdir/usr/share/fortune/off/$_filename"
	install -D -m644 "$srcdir/$_pkgname/$_filename.dat" "$pkgdir/usr/share/fortune/off/$_filename.dat"
}

