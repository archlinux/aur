# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=psc-package-git
pkgver=v0.5.1.r6.b97b29b
pkgrel=1
epoch=
pkgdesc="A package manager for PureScript based on package sets"
arch=('x86_64')
url="https://github.com/purescript/psc-package"
license=('BSD3')
groups=()
depends=()
makedepends=('ghc' 'stack' 'git')
checkdepends=()
optdepends=()
provides=('psc-package')
conflicts=('psc-package' 'psc-package-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git://github.com/purescript/psc-package.git#branch=master")
noextract=()
sha1sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	stack build
}

check() {
	cd "$srcdir/$pkgname"
	stack test
}

package() {
	cd "$pkgname"
	find .stack-work -type f -name 'psc-package' | grep -v 'install' | xargs install -D -m 0755 -t "$pkgdir/usr/bin"
	if [ -e LICENSE ]; then
		install -D -m 0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	fi
}
