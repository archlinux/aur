# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Adrian Sinclair <adrian at adrusi dot com>

_pkgname=terra
pkgname=$_pkgname-git
pkgver=0.0.0.r1213.gf6c76fc
pkgrel=1
pkgdesc="Low-level system programming language designed to interoperate seamlessly with Lua"
url="http://terralang.org/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('git' 'wget' 'clang35' 'llvm35')
source=("git://github.com/zdevito/terra.git")
sha256sums=('SKIP')

# Upstream doesn't have sane release tags yet but is moving
# towards semver. This will let us migrate to that when they
# do release (currently there is a 1.0.0-beta tag)
prepare() {
	cd "$_pkgname"
	git tag -f 0.0.0 $(git rev-list --max-parents=0 HEAD)
}

pkgver() {
	cd "$_pkgname"
	git describe --tags --abbrev=7 --match="[0-9\.]*" HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cp -r release "$pkgdir/usr"
}
