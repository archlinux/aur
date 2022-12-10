# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emmie Maeda <emmie.maeda@gmail.com>

# I *DO NOT* maintain the source repo.
# This package does not run the python build script to avoid trusting
# the git repo, but you should still inspect the package before installing.

pkgname=fortune-mod-g-git
_pkgname=gfortune
pkgver=r10.87ddd54
pkgrel=1
pkgdesc='Fortune quotes from /g/'
arch=('any')
groups=('fortune-mods')
url='https://github.com/ketogenesis/gfortune'
license=('unknown')
install="$pkgname.install"
depends=('fortune-mod')
makedepends=('bsd-games' 'git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	caesar 13 < gsource > g
	strfile -x g g.dat
}

package() {
	cd "$_pkgname"
	install -Dvm644 g g.dat -t "$pkgdir/usr/share/fortune/off/"
}
