# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Orche <orkv1234@gmail.com>
_pkgname=StackTower
pkgname=stacktower-git
pkgrel=1
pkgver=r5.4dc88ae
pkgdesc="Generates a dependency graph in the style of XKCD #2347"
arch=(x86_64 armv7h aarch64)
url="https://github.com/matzehuels/stacktower"
license=('Apache-2.0')
makedepends=("go" "make" "git")
provides=("stacktower")
conflicts=("stacktower")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

# check() {
# 	cd "$srcdir/$_pkgname"
# 	make test
# }

package() {
    cd "$srcdir/$_pkgname"
	install -Dm755 "./bin/stacktower" "$pkgdir/usr/bin/stacktower"
}
